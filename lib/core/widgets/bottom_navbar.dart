import 'package:bari_koi_map_with_autocomplete/app/app_router.dart';
import 'package:bari_koi_map_with_autocomplete/bootstrap.dart';
import 'package:bari_koi_map_with_autocomplete/core/widgets/bottom_nav_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  void _changeScreen(int index) {
    if (index == 0) {
      router.go('/');
    }
    if (index == 1) {
      router.go('/saved');
    }
  }

  void _updateIndex() {
    if (GoRouter.of(context).routeInformationProvider.value.uri ==
        Uri(path: '/')) {
      setState(() {
        currentIndex = 0;
      });
    }
    if (GoRouter.of(context).routeInformationProvider.value.uri ==
        Uri(path: '/saved')) {
      setState(() {
        currentIndex = 1;
      });
    }
  }

  @override
  void initState() {
    GoRouter.of(context).routeInformationProvider.addListener(() {
      _updateIndex();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            onTap: (int index) async {
              _changeScreen(index);
              _updateIndex();
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
    );
  }
}
