import 'package:get/get.dart';

import '../../../domain/usecases/auth/search_usecase.dart';

class HomeController extends GetxController {
  final SearchUseCase searchUseCase;
  // Observable states
  final Rx<bool> isLoading = false.obs;
  final Rx<String?> errorMessage = Rx<String?>(null);
  final Rx<dynamic> searchData = Rx<dynamic>(null);

  HomeController(this.searchUseCase);

  Future<void> search({required String text}) async {
    Map<String, dynamic> values = {};
    values['lat'] = '23.7812685';
    values['long'] = '90.4128795';
    values['text_search'] = text;
    values['catSubCat'] = null;
    values['business_name'] = null;

    isLoading.value = true;

    final result = await searchUseCase.search(values: values);

    result.fold(
          (failure) {
        errorMessage.value = failure.message;
        searchData.value = null;
      },
          (success) {
        errorMessage.value = null;
        searchData.value = success;
      },
    );

    isLoading.value = false;
  }

  bool get hasResults => searchData.value != null;

  // Add this method to clear search results
  void clearSearch() {
    searchData.value = null;
    errorMessage.value = null;
  }
}
