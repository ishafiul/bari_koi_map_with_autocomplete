import 'package:bari_koi_map_with_autocomplete/core/widgets/shell_widget.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/data/models/autocomplete_model.dart';
import 'package:bari_koi_map_with_autocomplete/features/map/presentation/screen/map_screen.dart';
import 'package:bari_koi_map_with_autocomplete/features/saved/presentation/screen/saved_address_sceen.dart';
import 'package:go_router/go_router.dart';

/// it will return [GoRouter] object,
/// that can be use for navigation between pages
GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  /*errorBuilder: (context, state) {
    return const PageNotFound();
  },*/
  initialLocation: '/',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) {
            final Place? extra = state.extra as Place?;
            return NoTransitionPage(
              key: state.pageKey,
              child: MapScreen(
                place: extra,
              ),
            );
          },
        ),
        GoRoute(
          path: '/saved',
          name: 'Saved',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const SavedAddressAcreen(),
            );
          },
        ),
      ],
      builder: (context, state, child) => ShellWidget(
        child: child,
      ),
    ),
  ],
);
