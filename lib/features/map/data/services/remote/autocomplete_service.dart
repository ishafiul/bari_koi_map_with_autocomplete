import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'autocomplete_service.g.dart';

@RestApi()
abstract class AutocompleteService {
  factory AutocompleteService(Dio dio, {String baseUrl}) = _AutocompleteService;

  @GET(
    "/search/autocomplete/place",
  )
  Future<HttpResponse<AutocompleteModel>> getHistory(
    @Queries() AutocompleteInput params,
  );
}

AutocompleteInput deserializeEnterAutocompleteInput(String json) =>
    AutocompleteInput.fromJson(json as Map<String, Object?>);
