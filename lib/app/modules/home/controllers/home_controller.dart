import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  //final sheetController = SheetController();

  // Observables (reactive state variables)
  final markers = <Marker>{}.obs;
  // final allBusinessData = <CommonBusinessCardDataModel>[].obs;
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
}
