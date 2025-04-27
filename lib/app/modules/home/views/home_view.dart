import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';
import 'package:get_x/app/modules/home/controllers/search_controller.dart';
import 'package:get_x/app/modules/home/views/widgets/home_drawer.dart';
import 'package:get_x/core/utils/constants/app_text.dart';
import 'package:get_x/core/utils/helpers/helper_function.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/constants/enams.dart';
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
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace24),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: searchController.searchText.value,
                    decoration: InputDecoration(
                      hintText: AppText.search,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => searchController.handleSearch(),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    ),
                  ),
                ),
              )),
        ],
      ),
      drawer: HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Obx(() => Text(
              controller.nearbyBusinessList.length.toString(),
              style: TextStyle(color: Colors.red),
            )),
      ),
      body: Center(
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.nearbyBusinessList.length,
            itemBuilder: (context, index) {
              final business = controller.nearbyBusinessList[index];
              return ListTile(
                title: Text(business.businessName??'Empty'), // assuming CommonBusinessModel has a 'name' property
              );
            },
          );
        }),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final searchController = Get.find<SearchBoxController>();

      switch (searchController.state.value) {
        case AppStatus.initial:
          return const Center(child: Text(AppText.startSearching));

        case AppStatus.loading:
          return const Center(child: CircularProgressIndicator());

        case AppStatus.success:
          if (searchController.hasResults) {
            return SearchList(state: searchController.searchData.value);
          } else {
            return const Center(child: Text(AppText.noResultFound));
          }

        case AppStatus.error:
          final errorMsg = searchController.errorMessage.value!;
          logView(errorMsg);
          return Center(child: Text(errorMsg, style: const TextStyle(color: Colors.red)));
      }
    });
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
