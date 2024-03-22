import 'package:bari_koi_map_with_autocomplete/features/saved/data/repositories/saved_places_repository.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/domain/usecases/get_saved_places.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_places_state.dart';

class SavedPlacesCubit extends Cubit<SavedPlacesState> {
  final SavedPlacesRepository _repository;

  SavedPlacesCubit(this._repository) : super(SavedPlacesInitial());

  Future<void> getSavedPlaces() async {
    emit(SavedPlacesLoading());
    final useCase = GetSavedPlaces(_repository);
    final places = await useCase.call();
    emit(SavedPlacesLoaded(savedPlaces: places));
  }
}
