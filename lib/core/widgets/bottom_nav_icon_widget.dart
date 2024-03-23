import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:bari_koi_map_with_autocomplete/core/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavIconItem extends StatelessWidget {
  const BottomNavIconItem({
    super.key,
    required this.currentActiveIndex,
    required this.index,
  });

  final int currentActiveIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: currentActiveIndex == index
              ? AppColor.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: currentActiveIndex == index ? 92.w : 80.w,
          height: 42.r,
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                index == 0 ? CustomIcons.map_1 : CustomIcons.bookmark_1,
                color: currentActiveIndex == index
                    ? Colors.white
                    : AppColor.primary2,
                size: 20.r,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                index == 0 ? 'Barikoi Map' : 'Saved',
                style: TextStyle(
                  color: currentActiveIndex == index
                      ? Colors.white
                      : AppColor.primary,
                  fontSize: 10.r,
                  fontFamily: 'Graphik',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
