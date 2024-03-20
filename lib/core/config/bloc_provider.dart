import 'package:bari_koi_map_with_autocomplete/core/cubits/zoom_drawer/zoom_drawer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// [Provider] is a [Singleton] that will provide [List] of [BlocProvider].
/// need to provide [BlocProvider] for those `bloc` or `cubit`
/// that will be available
/// throw out the application. inside [App] widget we wrapped our [MaterialApp]
/// with [MultiBlocProvider] and we are passing those bloc providers.
@Singleton()
class Provider {
  /// [List] of [BlocProvider]
  List<BlocProvider> providers = [
    BlocProvider<ZoomDrawerMenuCubit>(
      create: (context) => ZoomDrawerMenuCubit(),
    ),
  ];
}
