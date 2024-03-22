import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/get_it.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/custom_icons_icons.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/map_utils.dart';
import 'package:bari_koi_map_with_autocomplete/core/widgets/snackbar.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/services/local/saved_place_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class PlaceInfo extends StatelessWidget {
  const PlaceInfo({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  place.address!.split(',').first,
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 18.r,
                    fontFamily: 'Graphik',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  place.address ?? '',
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 12.r,
                    fontFamily: 'Graphik',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  children: [
                    Text(
                      place.pType ?? '',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12.r,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 3.w,
                      height: 3.w,
                      decoration: const ShapeDecoration(
                        color: AppColor.secondary,
                        shape: OvalBorder(),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        Icon(
                          CustomIcons.car,
                          size: 12.r,
                          color: AppColor.secondary,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '9 min',
                          style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: 12.r,
                            fontFamily: 'Graphik',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Row(
                  children: [
                    Icon(
                      CustomIcons.location_1,
                      size: 15.r,
                      color: AppColor.secondary,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      formatLatLng(
                        LatLng(
                          double.parse(place.latitude),
                          double.parse(place.longitude),
                        ),
                      ),
                      style: const TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 34.h,
            height: 34.h,
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0xFFBCDED3),
                  blurRadius: 4,
                  spreadRadius: 1.50,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              shape: const OvalBorder(),
              child: InkWell(
                onTap: () async {
                  final data = SavedPlace()
                    ..longitude = place.longitude
                    ..latitude = place.latitude
                    ..city = place.city
                    ..uCode = place.uCode
                    ..pType = place.pType
                    ..address = place.address
                    ..areaBn = place.areaBn
                    ..cityBn = place.cityBn
                    ..postCode = place.postCode
                    ..id = place.id
                    ..addressBn = place.addressBn
                    ..area = place.area;
                  final saved =
                      await getIt<SavedPlaceService>().savePlace(data);
                  if (saved == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: AppSnackBar(message: "Already saved"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: AppSnackBar(message: "Saved successfully"),
                      ),
                    );
                  }
                },
                child: Icon(
                  CustomIcons.bookmark_2,
                  color: AppColor.secondary,
                  size: 18.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
