import 'dart:async';

import 'package:flutter/services.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

const String _markerName = 'custom-marker';

const String _assetMarker = "assets/images/marker.png";

SymbolOptions _symbolOptions({
  required LatLng geometry,
}) {
  return SymbolOptions(
    geometry: geometry,
    iconImage: _markerName,
    iconSize: .25,
    iconAnchor: 'bottom',
    textField: 'test',
    textSize: 12.5,
    textOffset: const Offset(0, 1.2),
    textAnchor: 'bottom',
    textColor: '#000000',
    textHaloBlur: 1,
    textHaloColor: '#ffffff',
    textHaloWidth: 0.8,
  );
}

Future<void> _baseMarker({
  required MaplibreMapController controller,
}) async {
  final ByteData bytes = await rootBundle.load(_assetMarker);
  final Uint8List list = bytes.buffer.asUint8List();
  return controller.addImage(_markerName, list);
}

Future<Symbol> addMarker({
  required LatLng geometry,
  required MaplibreMapController controller,
}) async {
  await _baseMarker(controller: controller);
  return await controller.addSymbol(_symbolOptions(geometry: geometry));
}

Future<Symbol> updateMapPosition({
  required MaplibreMapController controller,
  Symbol? currentSymbol,
  required LatLng latLng,
}) async {
  await controller.animateCamera(
    duration: const Duration(seconds: 1),
    CameraUpdate.newCameraPosition(
      CameraPosition(
        target: latLng,
        zoom: 14,
      ),
    ),
  );
  if (currentSymbol != null) {
    await controller.removeSymbol(currentSymbol);
  }
  return await addMarker(
    controller: controller,
    geometry: latLng,
  );
}
