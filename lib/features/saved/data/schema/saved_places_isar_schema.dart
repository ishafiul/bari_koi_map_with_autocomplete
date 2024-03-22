import 'package:isar/isar.dart';

part 'saved_places_isar_schema.g.dart';

@Collection()
class Saved {
  Id id = Isar.autoIncrement;

  SavedPlace? savedPlace;
}

@embedded
class SavedPlace {
  int? id;
  String? longitude;
  String? latitude;
  String? address;
  String? addressBn;
  String? city;
  String? cityBn;
  String? area;
  String? areaBn;
  int? postCode;
  String? pType;
  String? uCode;
}
