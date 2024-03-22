import 'package:bari_koi_map_with_autocomplete/features/saved/data/schema/saved_places_isar_schema.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// The `DB` class represents the database configuration and
/// initialization for Isar.
///
/// This class is annotated with `@singleton` to ensure a single instance
/// throughout the application.
///
@singleton
class DB {
  /// The Isar instance for the local database.
  late Future<Isar> local;

  /// The constructor for the [DB] class.
  ///
  /// Initializes the local Isar database by calling the [_openDB] method.
  DB() {
    local = _openDB();
  }

  /// Asynchronous method to open and configure the local Isar database.
  ///
  /// This method retrieves the application documents directory
  /// and opens the Isar database
  Future<Isar> _openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [SavedSchema],
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
