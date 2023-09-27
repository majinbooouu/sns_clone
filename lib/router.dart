import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/authentication/repos/authentication_repo.dart';
import 'package:sns_clone/authentication/views/sign_in_screen.dart';
import 'package:sns_clone/authentication/views/sign_up_screen.dart';
import 'package:sns_clone/commons/views/main_navigation_screen.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authStateProvider);
    final isLoggedIn = ref.read(authRepoProvider).isLoggedIn;
    return GoRouter(
      initialLocation: "/home",
      redirect: (context, state) {
        if (!isLoggedIn) {
          if (state.subloc != SignUpScreen.routeURL &&
              state.subloc != SignInScreen.routeURL) {
            return SignInScreen.routeURL;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: SignInScreen.routeURL,
          name: SignInScreen.routeName,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: SignUpScreen.routeURL,
          name: SignUpScreen.routeName,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: "/:tab(home|write)",
          name: MainNavigationScreen.routeName,
          builder: (context, state) {
            final tab = state.params["tab"]!;
            return MainNavigationScreen(tab: tab);
          },
        ),
      ],
    );
  },
);
