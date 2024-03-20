import 'dart:math';

import 'package:bari_koi_map_with_autocomplete/core/config/env.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/map_utils.dart';
import 'package:bari_koi_map_with_autocomplete/core/widgets/bottom_navbar.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/nearby_me.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/search_input_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition initialPosition = const CameraPosition(
    target: LatLng(23.835677, 90.380325),
    zoom: 14,
  );

  MaplibreMapController? mController;

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mController!.addImage(name, list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MaplibreMap(
            initialCameraPosition: initialPosition,
            onMapCreated: (MaplibreMapController mapController) {
              mController = mapController;
            },
            compassViewPosition: CompassViewPosition.TopRight,
            compassViewMargins: Point(16.w, 172.h),
            styleString:
                'https://map.barikoi.com/styles/osm-liberty/style.json?key=${EnvProd.barikoiApiKey}',
            onStyleLoadedCallback: () {
              addMarker(
                controller: mController!,
                geometry: const LatLng(23.835677, 90.380325),
              );
            },
          ),
          Positioned(
            top: 20.h,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  SearchInputAppBar(),
                  const NarebyMeList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
