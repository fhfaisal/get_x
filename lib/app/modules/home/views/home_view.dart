import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';
import 'package:get_x/app/modules/home/controllers/search_controller.dart';
import 'package:get_x/app/modules/home/views/widgets/home_drawer.dart';
import 'package:get_x/core/utils/constants/app_text.dart';
import 'package:get_x/core/utils/helpers/helper_function.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/debug/log_read.dart';
import '../../../domain/entities/search_data.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    SearchBoxController searchController = Get.find<SearchBoxController>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(()=> Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace24),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                controller: searchController.searchText.value,
                decoration: InputDecoration(
                  hintText: AppText.search,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () =>searchController.handleSearch(),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                ),
              ),
            ),
          )),
        ],
      ),
      drawer: HomeDrawer(),
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
        return const Center(child: Text(AppText.startSearching));
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
      return const Center(child: Text(AppText.noResultFound, style: TextStyle(fontSize: 16)));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.sm_8),
            child: Text(AppText.category, style: Theme.of(context).textTheme.headlineSmall!.apply(heightFactor: 1.5)),
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
          Text(AppText.subCategory, style: Theme.of(context).textTheme.headlineSmall!.apply(heightFactor: 1.5)),
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