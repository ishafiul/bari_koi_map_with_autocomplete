import 'package:bari_koi_map_with_autocomplete/core/config/env.dart';
import 'package:bari_koi_map_with_autocomplete/core/cubits/zoom_drawer/zoom_drawer_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/repositories/autocomplete_repository.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/services/remote/autocomplete_service.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/cubits/auto_complete/auto_complete_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/cubits/selected_place/selected_place_cubit.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/repositories/saved_places_repository.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/services/local/saved_place_service.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/domain/cubits/saved_places/saved_places_cubit.dart';
import 'package:dio/dio.dart';
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
    BlocProvider<SelectedPlaceCubit>(
      create: (context) => SelectedPlaceCubit(),
    ),
    BlocProvider<SavedPlacesCubit>(
      create: (context) {
        return SavedPlacesCubit(SavedPlacesRepository(SavedPlaceService()));
      },
    ),
    BlocProvider<AutoCompleteCubit>(
      create: (context) {
        final Dio dio = Dio();
        dio.options = BaseOptions(
          baseUrl: EnvProd.barikoiHost,
          contentType: "application/json",
        );
        return AutoCompleteCubit(
          AutocompleteRepository(AutocompleteService(dio)),
        );
      },
    ),
  ];
}
