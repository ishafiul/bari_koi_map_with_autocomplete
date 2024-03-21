import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/services/remote/autocomplete_service.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/domain/repositories/i_autocomplete_repository.dart';
import 'package:retrofit/dio.dart';

class AutocompleteRepository implements IAutoCompleteRepository {
  final AutocompleteService _service;

  AutocompleteRepository(this._service);

  @override
  Future<HttpResponse<AutocompleteModel>> getAutocomplete(
    AutocompleteInput params,
  ) async {
    final response = await _service.getHistory(params);
    return response;
  }
}
