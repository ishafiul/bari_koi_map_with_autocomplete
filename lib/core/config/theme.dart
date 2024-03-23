import 'package:bari_koi_map_with_autocomplete/core/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// a [Singleton] class that hold our project theming info
@singleton
class AppTheme {
  /// getter for light theme
  ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    final colorScheme = baseTheme.colorScheme.copyWith(
      primary: AppColor.primary,
      onPrimary: Colors.white,
      surfaceTint: Colors.white,
    );

    return baseTheme.copyWith(
      colorScheme: colorScheme,
      // config goose here ...
    );
  }
}
