import 'package:bari_koi_map_with_autocomplete/core/config/get_it.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// [GetIt] instance
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)

/// this will init [GetIt] for our project. we are using
/// [GetIt] with [Injectable].
/// so every [Injectable] file for this project will init when this
/// function will call
void initDependencies() => $initGetIt(getIt);
