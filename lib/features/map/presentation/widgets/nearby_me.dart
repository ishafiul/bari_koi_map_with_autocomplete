import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/custom_icons_icons.dart';
import 'package:bari_koi_map_with_autocomplete/core/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<NearbyMeInfo> nearbyMeList = [
  NearbyMeInfo(
    icon: CustomIcons.atm,
    text: 'ATM',
  ),
  NearbyMeInfo(
    icon: CustomIcons.school,
    text: 'School',
  ),
  NearbyMeInfo(
    icon: CustomIcons.hospital,
    text: 'Hospital',
  ),
  NearbyMeInfo(
    icon: CustomIcons.bank,
    text: 'Bank',
  ),
];

class NearbyMeInfo {
  NearbyMeInfo({required this.icon, required this.text});

  final IconData icon;
  final String text;
}

class NarebyMeList extends StatelessWidget {
  const NarebyMeList({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: nearbyMeList.length,
      itemBuilder: (context, index) => Container(
        height: 25.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.50).r,
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 6).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    nearbyMeList[index].icon,
                    size: 14.r,
                    color: AppColor.secondary,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    nearbyMeList[index].text,
                    style: TextStyle(
                      color: Color(0xFF2F4050),
                      fontSize: 12.r,
                      fontFamily: 'Graphik',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
