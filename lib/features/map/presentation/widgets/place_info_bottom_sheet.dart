import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/bottom_sheet_additional_info.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/bottom_sheet_place_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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




