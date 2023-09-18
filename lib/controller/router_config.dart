import 'package:go_router/go_router.dart';
import 'package:idukaan/view/init_screen.dart';
import 'package:idukaan/view/user/login/user_login_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_view.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/idukaan/user',
  routes: <RouteBase>[
    GoRoute(
      path: '/idukaan',
      builder: (context, state) {
        // TODO : Create iDukaan Features Page and APIs
        return const InitScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'user',
          builder: (context, state) {
            return const InitScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'login',
              builder: (context, state) => const UserLoginScreen(),
            ),
            GoRoute(
              path: 'signup',
              builder: (context, state) => const UserSignupView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
