import 'package:bari_koi_map_with_autocomplete/app/app_router.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/get_it.dart';
import 'package:bari_koi_map_with_autocomplete/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [App] is a [StatelessWidget] that will hold material app with
class App extends StatelessWidget {
  /// starting point of our app
  /// this [StatelessWidget] will hold material app with
  /// go_router, and global blog provider. also `ScreenUtil` setup is here
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (BuildContext context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: getIt<AppTheme>().lightTheme,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    );
  }
}
