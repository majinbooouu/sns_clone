import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/test.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: TestScreen.routeURL,
      routes: [
        GoRoute(
          path: TestScreen.routeURL,
          name: TestScreen.routeName,
          builder: (context, state) => const TestScreen(),
        ),
        // GoRoute(
        //   path: MainNavigationScreen.routeURL,
        //   name: MainNavigationScreen.routeName,
        //   builder: (context, state) => const MainNavigationScreen(
        //     tab: "(home|search|activity|profile)",
        //   ),
        // ),
      ],
    );
  },
);
