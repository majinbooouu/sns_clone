import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';
import 'package:sns_clone/authentication/views/sign_in_screen.dart';
import 'package:sns_clone/post/views/test_post_screen.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authStateProvider);
    return GoRouter(
      initialLocation: SignInScreen.routeURL,
      routes: [
        GoRoute(
          path: SignInScreen.routeURL,
          name: SignInScreen.routeName,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: TestHomeScreen.routeURL,
          name: TestHomeScreen.routeName,
          builder: (context, state) => const TestHomeScreen(),
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
