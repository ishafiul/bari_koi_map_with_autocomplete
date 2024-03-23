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
  Symbol? currentSymbol,
  required MaplibreMapController controller,
}) async {
  if (currentSymbol != null) {
    await controller.removeSymbol(currentSymbol);
  }
  await _baseMarker(controller: controller);
  return await controller.addSymbol(_symbolOptions(geometry: geometry));
}

Future<void> updateMapPosition({
  required MaplibreMapController controller,
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
