import 'package:bari_koi_map_with_autocomplete/core/widgets/bottom_navbar.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ShellWidget extends StatefulWidget {
  const ShellWidget({super.key, required this.child});

  final Widget child;

  @override
  State<ShellWidget> createState() => _ShellWidgetState();
}

class _ShellWidgetState extends State<ShellWidget> {
  late ZoomDrawerController zoomDrawerController;

  @override
  void initState() {
    super.initState();
    zoomDrawerController = ZoomDrawerController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: const AppMenu(),
      mainScreen: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: SafeArea(
          child: widget.child,
        ),
      ),
      controller: zoomDrawerController,
      angle: 0,
      androidCloseOnBackTap: true,
      shadowLayer1Color: Colors.white,
      clipMainScreen: false,
      mainScreenScale: 0,
      mainScreenTapClose: true,
      disableDragGesture: true,
      slideWidth: MediaQuery.sizeOf(context).width * 0.7,
      menuScreenWidth: MediaQuery.sizeOf(context).width * 0.7,
    );
  }
}
