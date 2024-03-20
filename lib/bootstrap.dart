import 'dart:async';

import 'package:bari_koi_map_with_autocomplete/core/config/get_it.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:stack_trace/stack_trace.dart';

/// show console log with [Logger].
Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 100,
    errorMethodCount: 100,
  ),
);

/// [AppBlocObserver]
class AppBlocObserver extends BlocObserver {
  /// this class will show every bloc event inside console
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (error is StateError &&
        error.message == 'Cannot emit new states after calling close') {
      logger.e('onError(${bloc.runtimeType}, $error,'
          '${Trace.from(stackTrace)} )');
    } else {
      super.onError(bloc, error, stackTrace);
    }
  }
}

/// this function i responsible for bootstrap all utills
/// that needs to initialize
/// before app main ui start.
Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  FlutterError.onError = (details) {
    logger.e(
      details.exceptionAsString(),
      stackTrace: details.stack == null ? null : Trace.from(details.stack!),
    );
  };
  Bloc.observer = const AppBlocObserver();

  //* GoogleFonts License Registry
  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ]);

      FlutterError.onError = (FlutterErrorDetails details) {
        logger.e(
          details.exceptionAsString(),
          stackTrace: details.stack == null ? null : Trace.from(details.stack!),
        );
      };

      /// init get_it dependencies
      initDependencies();

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
          systemNavigationBarColor: Colors.transparent,
        ),
      );
      runApp(await builder());
    },
    (Object error, StackTrace stackTrace) {
      logger.e(error.toString(), stackTrace: Trace.from(stackTrace));

      if (error is FlutterError) {
        if (error.message.toLowerCase().contains('renderflex')) {
          logger.e('$error, ${Trace.from(stackTrace)}');
        } else if (error.message
            .toLowerCase()
            .contains('cannot emit new states')) {
          logger.e('$error, ${Trace.from(stackTrace)}');
        } else {
          logger.e('$error, ${Trace.from(stackTrace)}');
        }
      } else {
        logger.e('$error, ${Trace.from(stackTrace)}');
      }
    },
  );
}
