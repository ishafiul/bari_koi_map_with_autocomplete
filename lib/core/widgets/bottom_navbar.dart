import 'package:bari_koi_map_with_autocomplete/core/widgets/bottom_nav_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.child});

  final Widget child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Container(
                height: 72.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x84C7DAD4),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: currentIndex,
                    onTap: (int index) {
                      currentIndex = index;
                      setState(() {});
                    },
                    items: List.generate(
                      2,
                      (index) => BottomNavigationBarItem(
                        icon: BottomNavIconItem(
                          currentActiveIndex: currentIndex,
                          index: index,
                        ),
                        label: '',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
