import 'package:bari_koi_map_with_autocomplete/core/config/env.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'autocomplete_service.g.dart';

@RestApi()
abstract class AutocompleteService {
  factory AutocompleteService(Dio dio, {String baseUrl}) = _AutocompleteService;

  @GET("/search/autocomplete/place?api_key=${EnvProd
      .barikoiApiKey}&q=jessore&city=dhaka&bangla=true")
  Future<AutocompleteModel> getAutocomplete(
      @Queries() AutocompleteInput queries,);

}
