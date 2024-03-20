import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
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
          height: 42,
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: currentActiveIndex == index
                    ? Colors.white
                    : AppColor.primary2,
                size: 20,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Favourite',
                style: TextStyle(
                  color: currentActiveIndex == index
                      ? Colors.white
                      : AppColor.primary,
                  fontSize: 10,
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
