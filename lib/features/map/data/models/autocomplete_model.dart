import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete_model.freezed.dart';

part 'autocomplete_model.g.dart';

@freezed
class AutocompleteModel with _$AutocompleteModel {
  const factory AutocompleteModel({
    required List<Place> places,
    required int status,
  }) = _AutocompleteModel;

  factory AutocompleteModel.fromJson(Map<String, Object?> json) =>
      _$AutocompleteModelFromJson(json);
}

@freezed
class Place with _$Place {
  const factory Place({
    required int id,
    required double longitude,
    required double latitude,
    required String address,
    required String addressBn,
    required String city,
    required String cityBn,
    required String area,
    required String areaBn,
    required int postCode,
    required String pType,
    required String uCode,
  }) = _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}

@freezed
class AutocompleteInput with _$AutocompleteInput {
  const factory AutocompleteInput({
    required String q,
    String? city,
    bool? bangla,
  }) = _AutocompleteInput;

  factory AutocompleteInput.fromJson(Map<String, Object?> json) =>
      _$AutocompleteInputFromJson(json);
}
