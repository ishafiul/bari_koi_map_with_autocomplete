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

String formatLatLng(LatLng latLng) {
  // Function to format latitude and longitude coordinates
  final String latDirection = latLng.latitude >= 0 ? 'N' : 'S';
  final String lngDirection = latLng.longitude >= 0 ? 'E' : 'W';

  final String formattedLat = _formatCoordinate(latLng.latitude.abs(), '');
  final String formattedLng = _formatCoordinate(latLng.longitude.abs(), '');

  return '$formattedLat$latDirection, $formattedLng$lngDirection';
}

String _formatCoordinate(double coordinate, String type) {
  // Helper function to format individual coordinates
  final int degrees = coordinate.floor();
  final double minutesDouble = (coordinate - degrees) * 60;
  final int minutes = minutesDouble.floor();
  final double secondsDouble = (minutesDouble - minutes) * 60;
  final String seconds = secondsDouble.toStringAsFixed(1);

  return '$degrees°$minutes\'$seconds"$type';
}