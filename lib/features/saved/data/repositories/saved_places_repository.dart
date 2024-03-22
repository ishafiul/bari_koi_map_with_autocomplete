import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/services/local/saved_place_service.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/domain/repositories/i_saved_places_repository.dart';

class SavedPlacesRepository implements ISavedPlacesRepository {
  final SavedPlaceService _service;

  SavedPlacesRepository(this._service);

  @override
  Future<List<Saved>> getSavedPlaces() async {
    return _service.getSavedPlaces();
  }
}
