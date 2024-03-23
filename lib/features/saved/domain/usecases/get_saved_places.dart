import 'package:bari_koi_map_with_autocomplete/features/saved/data/repositories/saved_places_repository.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';

class GetSavedPlaces {
  final SavedPlacesRepository _repository;

  GetSavedPlaces(this._repository);

  Future<List<Saved>> call() async {
    return await _repository.getSavedPlaces();
  }
}
