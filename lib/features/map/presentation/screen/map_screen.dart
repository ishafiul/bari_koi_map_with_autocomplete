import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/map.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
    return Scaffold(
      body: ZoomDrawer(
        menuScreen: const AppMenu(),
        mainScreen: MainMap(
          toggleMap: () => zoomDrawerController.toggle?.call(),
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
      ),
    );
  }
}
