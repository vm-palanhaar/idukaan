import 'package:go_router/go_router.dart';
import 'package:idukaan/view/init_screen.dart';
import 'package:idukaan/view/user/login/user_login_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_1_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_2_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_3_screen.dart';
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
              routes: <RouteBase>[
                GoRoute(
                  path: '1',
                  builder: (context, state) => const UserSignup1Screen(),
                ),
                GoRoute(
                  path: '2',
                  builder: (context, state) => const UserSignup2Screen(),
                ),
                GoRoute(
                  path: '3',
                  builder: (context, state) => const UserSignup3Screen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
