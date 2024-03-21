import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/repositories/autocomplete_repository.dart';
import 'package:retrofit/dio.dart';

/// Get history use case
class GetAutocomplete {
  final AutocompleteRepository _repository;

  GetAutocomplete(this._repository);

  Future<HttpResponse<AutocompleteModel>> call(
    AutocompleteInput params,
  ) async {
    return await _repository.getAutocomplete(params);
  }
}
