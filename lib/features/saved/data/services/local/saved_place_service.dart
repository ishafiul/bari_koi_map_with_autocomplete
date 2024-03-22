import 'package:bari_koi_map_with_autocomplete/core/config/get_it.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/isar_db.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

/// The `AppStateService` class implements the [IAppStateService] interface.
///
@singleton
class SavedPlaceService {
  Future<List<Saved>> getSavedPlaces() async {
    final db = await getIt<DB>().local;
    final places = await db.saveds.where().findAll();
    return places;
  }

  Future<Saved?>? getSavedPlaceByID({required String placeId}) async {
    final db = await getIt<DB>().local;
    final places = await db.saveds.where().findAll();
    final place = places
        .where((element) => element.savedPlace?.uCode == placeId)
        .firstOrNull;
    return place;
  }

  Future<Saved?> savePlace(SavedPlace place) async {
    final db = await getIt<DB>().local;
    int id = 0;
    await db.writeTxn(() async {
      id = await db.saveds.put(Saved()..savedPlace = place);
    });
    return await db.saveds.get(id);
  }

  Future<bool> deletePlace(int objectId) async {
    final db = await getIt<DB>().local;
    return await db.saveds.delete(objectId);
  }
}
