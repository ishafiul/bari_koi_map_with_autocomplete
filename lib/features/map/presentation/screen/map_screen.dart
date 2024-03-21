import 'dart:math';

import 'package:bari_koi_map_with_autocomplete/app/app_router.dart';
import 'package:bari_koi_map_with_autocomplete/bootstrap.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/env.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/map_utils.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/nearby_me.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/place_info_bottom_sheet.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/search_input_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.place});

  final Place? place;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition initialPosition = const CameraPosition(
    target: LatLng(23.835677, 90.380325),
    zoom: 14,
  );
  Symbol? symbol;
  bool isOpenBottomSheet = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MapScreen oldWidget) {
    if (widget.place != oldWidget.place) {
      updateMapPosition(
        controller: mController!,
        latLng: LatLng(
          double.parse(widget.place!.latitude),
          double.parse(widget.place!.longitude),
        ),
        currentSymbol: symbol,
      ).then((value) => symbol = value);
      isOpenBottomSheet = true;
    }
    super.didUpdateWidget(oldWidget);
  }

  MaplibreMapController? mController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: isOpenBottomSheet
          ? PlaceInfoBottomSheet(
              onClose: () {
                if (symbol != null) {
                  mController?.removeSymbol(symbol!);
                  isOpenBottomSheet = false;
                  setState(() {});
                }
              },
            )
          : null,
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
          ),
          Positioned(
            top: 20.h,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: const Column(
                children: [
                  SearchInputAppBar(),
                  NarebyMeList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
