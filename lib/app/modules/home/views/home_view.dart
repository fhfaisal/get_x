import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';
import 'package:get_x/app/modules/home/controllers/search_controller.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/debug/log_read.dart';
import '../../../domain/entities/search_data.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    SearchBoxController searchController = Get.find<SearchBoxController>();
    final searchText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 250, // Adjust width as needed
              child: TextField(
                controller: searchText,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchText.clear();
                      searchController.clearSearch(); // Clear search results
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final query = searchText.text.trim();
              if (query.isNotEmpty) {
                searchController.search(text: query);
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        if (searchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (searchController.errorMessage.value != null) {
          final errorMsg = searchController.errorMessage.value!;
          logView(errorMsg);
          return Center(child: Text(errorMsg, style: const TextStyle(color: Colors.red)));
        } else if (searchController.hasResults) {
          return SearchList(state: searchController.searchData.value);
        }
        return const Center(child: Text('Start searching...'));
      }),
    );
  }
}

// SearchList widget remains largely the same
class SearchList extends StatelessWidget {
  const SearchList({super.key, required this.state});

  final SearchData state;

  @override
  Widget build(BuildContext context) {
    if (state.category == null || state.category!.isEmpty) {
      return const Center(child: Text('No results found', style: TextStyle(fontSize: 16)));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.sm_8),
            child: Text('Category', style: Theme.of(context).textTheme.headlineSmall!.apply(heightFactor: 1.5)),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.category!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(state.category![index].name ?? ''),
                  ),
                );
              },
            ),
          ),
          Text('Subcategory', style: Theme.of(context).textTheme.headlineSmall!.apply(heightFactor: 1.5)),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.subcategory!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(state.subcategory![index].name ?? ''),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}