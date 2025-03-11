import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/models/nearbyBusiness/common_business_model.dart';
import 'package:get_x/app/data/models/nearbyBusiness/nearby_business_list.dart';
import 'package:get_x/app/domain/entities/business/common_business_entity.dart';
import 'package:get_x/app/domain/usecases/home/nearby_business_usecase.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/constants/enams.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final NearbyBusinessUseCase nearbyBusinessUseCase = NearbyBusinessUseCase.instance;

  // Observable states using enum
  final Rx<AppStatus> state = AppStatus.initial.obs;
  final Rx<String?> errorMessage = Rx<String?>(null);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  //final Rx<dynamic> nearbyBusinessList = Rx<dynamic>(null);

  @override
  void onInit() {
    getNearbyBusiness();
    super.onInit();
  }


  //final sheetController = SheetController();

  // Observables (reactive state variables)
  final markers = <Marker>{}.obs;
  final RxList<CommonBusinessModel> nearbyBusinessList = <CommonBusinessModel>[].obs;

  // final visibleBusinessData = <CommonBusinessCardDataModel>[].obs;
  final selectedIndices = <int>[].obs;
  final isSearchPress = false.obs;
  final hasSelectedHint = false.obs;
  final hasShownNoMarkersMessage = false.obs;
  final markersLoaded = false.obs;
  final selectedTag = Rx<String?>(null);

  bool skipOnCameraIdle = false;
  Timer? debounceTimer;
  GoogleMapController? mapController;

  void onCameraIdle() async {
    if (!markersLoaded.value) return;

    if (skipOnCameraIdle) {
      skipOnCameraIdle = false;
      return;
    }

    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();

    debounceTimer = Timer(const Duration(milliseconds: 200), () async {
      final LatLngBounds bounds = await mapController!.getVisibleRegion();
      final visibleMarkers = markers.where((m) => bounds.contains(m.position)).toList();

      if (visibleMarkers.isEmpty) {
        if (!hasShownNoMarkersMessage.value) {
          hasShownNoMarkersMessage.value = true;
          Get.snackbar(
            'No Results',
            'No results found. Try panning or zooming the map.',
            duration: const Duration(seconds: 2),
          ).future.then((_) {
            hasShownNoMarkersMessage.value = false;
          });
        }
      }

      // visibleBusinessData.value = getVisibleBusinesses(bounds);
      //
      // // Replace BLoC event with direct API call or GetX service
      // updateVisibleBusinessData(visibleBusinessData);
    });
  }

  void buildMarkers(List<CommonBusinessModel> data) {
    final Set<Marker> newMarkers = {};

    for (final point in data) {
      double lat = double.tryParse(point.lat ?? '') ?? 0.0;
      double lng = double.tryParse(point.long ?? '') ?? 0.0;
      if (lat == 0 && lng == 0) continue;

      //bool isSelected = (point.id.toString() == selectedMarkerId);
      final BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

      newMarkers.add(Marker(
        markerId: MarkerId(point.id.toString()),
        position: LatLng(lat, lng),
        icon: markerIcon,
        //onTap: () => onMarkerTap(point),
      ));
    }

    markers.clear();
    markers.addAll(newMarkers);
    if (!markersLoaded.value && newMarkers.isNotEmpty) {
      markersLoaded.value = true;
    }
  }
  Future<void> showBusinessDetails(CommonBusinessModel business) async {
    await Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        alignment: Alignment.bottomCenter,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        child: Card(
          child: Text(business.businessName??''),
        )));
    }

  Future<void> getNearbyBusiness() async {
    Map<String, dynamic> values = {};
    values['lat'] = '23.7812685';
    values['long'] = '90.4128795';
    state.value = AppStatus.loading;

    final result = await nearbyBusinessUseCase.getNearbyBusiness(values: values);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        state.value = AppStatus.error;
      },
      (success) {
        nearbyBusinessList.value = success.data!;
        state.value = AppStatus.success;
        buildMarkers(success.data!);
      },
    );
  }
}
