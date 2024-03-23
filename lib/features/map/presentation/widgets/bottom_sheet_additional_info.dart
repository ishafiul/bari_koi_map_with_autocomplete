import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
