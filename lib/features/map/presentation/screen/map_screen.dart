import 'dart:math';

import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/env.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/custom_icons_icons.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/map_utils.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/permission_utils.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/cubits/selected_place/selected_place_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/nearby_me.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/place_info_bottom_sheet.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/search_input_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.place,
  });

  final Place? place;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Symbol? symbol;
  bool isOpenBottomSheet = false;

  Future<void> _permissionHandler() async {
    await handlePermission(
      context: context,
      permission: Permission.location,
      builder: (context) {
        return const Text('Wee Need Your Location!');
      },
    );
  }

  Future<void> _update(LatLng latLng) async {
    await updateMapPosition(
      controller: mController!,
      latLng: latLng,
    );
    symbol = await addMarker(
      controller: mController!,
      geometry: latLng,
    );
  }

  @override
  void initState() {
    _permissionHandler();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  MaplibreMapController? mController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocConsumer<SelectedPlaceCubit, SelectedPlaceState>(
        listener: (context, state) async {
          if (state is SelectedPlaceLoaded) {
            await _update(
              LatLng(
                double.parse(state.place.latitude),
                double.parse(state.place.longitude),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SelectedPlaceLoaded) {
            return PlaceInfoBottomSheet(
              onClose: () {
                if (symbol != null) {
                  mController?.removeSymbol(symbol!);
                }
                context.read<SelectedPlaceCubit>().clearSelectedPlace();
              },
              place: state.place,
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: BlocBuilder<SelectedPlaceCubit, SelectedPlaceState>(
        builder: (context, state) {
          if (state is SelectedPlaceLoaded) {
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 45).r,
            child: FloatingActionButton(
              shape: const OvalBorder(),
              backgroundColor: Colors.white,
              splashColor: AppColor.primary.withOpacity(0.2),
              onPressed: () async {
                if (symbol != null) {
                  context.read<SelectedPlaceCubit>().clearSelectedPlace();
                  await mController?.removeSymbol(symbol!);
                }
                await _permissionHandler();
                final sd = await Geolocator.getCurrentPosition();
                await updateMapPosition(
                  controller: mController!,
                  latLng: LatLng(
                    sd.latitude,
                    sd.longitude,
                  ),
                );
              },
              child: Icon(
                CustomIcons.location_pin,
                color: AppColor.secondary,
                size: 28.r,
              ),
            ),
          );
        },
      ),
      body: Stack(
        children: [
          MaplibreMap(
            myLocationEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(23.835677, 90.380325),
              zoom: 14,
            ),
            onMapCreated: (MaplibreMapController mapController) async {
              mController = mapController;
              if (widget.place != null) {
                await _update(
                  LatLng(
                    double.parse(widget.place!.latitude),
                    double.parse(widget.place!.longitude),
                  ),
                );
              }
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
