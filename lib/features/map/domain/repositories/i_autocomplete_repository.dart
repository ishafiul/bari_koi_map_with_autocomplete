import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:retrofit/dio.dart';

abstract class IAutoCompleteRepository {
  Future<HttpResponse<AutocompleteModel>> getAutocomplete(
    AutocompleteInput params,
  );
}
