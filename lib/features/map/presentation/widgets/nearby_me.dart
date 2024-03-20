import 'package:bari_koi_map_with_autocomplete/core/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NarebyMeList extends StatelessWidget {
  const NarebyMeList({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: 12,
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
                    Icons.safety_check_rounded,
                    size: 14.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text("data"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
