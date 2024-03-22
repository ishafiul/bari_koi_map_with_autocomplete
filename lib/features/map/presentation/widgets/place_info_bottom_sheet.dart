import 'package:bari_koi_map_with_autocomplete/bootstrap.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/get_it.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/custom_icons_icons.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/map_utils.dart';
import 'package:bari_koi_map_with_autocomplete/core/widgets/snackbar.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/services/local/saved_place_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class PlaceInfoBottomSheet extends StatelessWidget {
  const PlaceInfoBottomSheet({
    super.key,
    required this.onClose,
    required this.place,
  });

  final void Function() onClose;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == 0.2) {
          onClose();
        }
        return true;
      },
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 13,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: ListView(
              controller: scrollController,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 15.h,
                    bottom: 10.h,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/svg/minus.svg',
                  ),
                ),
                Column(
                  children: [
                    PlaceInfo(
                      place: place,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const Divider(
                      color: Color(0xffF1F1EF),
                      height: 2,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AdditionalPlaceInfo(
                      place: place,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
          Column(
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
                    ..longitude = widget.place.longitude
                    ..latitude = widget.place.latitude
                    ..city = widget.place.city
                    ..uCode = widget.place.uCode
                    ..pType = widget.place.pType
                    ..address = widget.place.address
                    ..areaBn = widget.place.areaBn
                    ..cityBn = widget.place.cityBn
                    ..postCode = widget.place.postCode
                    ..id = widget.place.id
                    ..addressBn = widget.place.addressBn
                    ..area = widget.place.area;
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

class AdditionalPlaceInfo extends StatelessWidget {
  const AdditionalPlaceInfo({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36).w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Place Code',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Container(
                width: 170.w,
                height: 23.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEEF5F4),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFF8CBEB4),
                    ),
                    borderRadius: BorderRadius.circular(7).r,
                  ),
                ),
                child: Center(
                  child: Text(
                    place.uCode ?? '',
                    style: TextStyle(
                      color: const Color(0xFF8CBEB4),
                      fontSize: 12.r,
                      fontFamily: 'Graphik',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'District',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Container(
                width: 170.w,
                height: 23.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF4E3E3),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFB44641),
                    ),
                    borderRadius: BorderRadius.circular(7).r,
                  ),
                ),
                child: Center(
                  child: Text(
                    place.city ?? '',
                    style: TextStyle(
                      color: const Color(0xFFB44641),
                      fontSize: 12.r,
                      fontFamily: 'Graphik',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Post Code',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12.r,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      ':',
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
              ),
              SizedBox(
                width: 40.w,
              ),
              Container(
                width: 170.w,
                height: 23.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE8F0FD),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF669DEF),
                    ),
                    borderRadius: BorderRadius.circular(7).r,
                  ),
                ),
                child: Center(
                  child: Text(
                    place.postCode.toString(),
                    style: TextStyle(
                      color: const Color(0xFF669DEF),
                      fontSize: 12.r,
                      fontFamily: 'Graphik',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
