import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';

abstract class ISavedPlacesRepository {
  Future<List<Saved>> getSavedPlaces();
}
