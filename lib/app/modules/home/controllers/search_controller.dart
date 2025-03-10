import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/auth/search_usecase.dart';

enum SearchState {
  initial,
  loading,
  success,
  error,
}

class SearchBoxController extends GetxController {
  final SearchUseCase searchUseCase = SearchUseCase.instance;

  // Observable states using enum
  final Rx<SearchState> state = SearchState.initial.obs;
  final Rx<String?> errorMessage = Rx<String?>(null);
  final Rx<dynamic> searchData = Rx<dynamic>(null);

  final searchText = TextEditingController().obs;

  Future<void> search({required String text}) async {
    Map<String, dynamic> values = {};
    values['lat'] = '23.7812685';
    values['long'] = '90.4128795';
    values['text_search'] = text;
    values['catSubCat'] = null;
    values['business_name'] = null;

    state.value = SearchState.loading;

    final result = await searchUseCase.search(values: values);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        searchData.value = null;
        state.value = SearchState.error;
      },
      (success) {
        searchData.value = success;
        state.value = SearchState.success;
      },
    );
  }

  bool get hasResults => searchData.value != null;

  void clearSearch() {
    searchData.value = null;
    errorMessage.value = null;
    state.value = SearchState.initial;
  }

  void handleSearch() {
    final query = searchText.value.text.trim();
    if (query.isNotEmpty) {
      search(text: query);
    }
  }
}
