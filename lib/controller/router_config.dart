import 'package:go_router/go_router.dart';
import 'package:idukaan/view/init/init_screen.dart';
import 'package:idukaan/view/main/business/business_screen.dart';
import 'package:idukaan/view/main/dashboard/dashboard_screen.dart';
import 'package:idukaan/view/main/profile/profile_screen.dart';
import 'package:idukaan/view/main/shop/shop_screen.dart';
import 'package:idukaan/view/user/kyc/user_init_kyc_screen.dart';
import 'package:idukaan/view/user/login/user_login_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_1_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_2_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_3_screen.dart';
import 'package:idukaan/view/user/signup/user_signup_accept_plc.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/idukaan/user',
  routes: <RouteBase>[
    GoRoute(
      path: '/idukaan/user',
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
          builder: (context, state) => const UserSignupAcceptPlc(),
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
        GoRoute(
          path: 'init-kyc',
          builder: (context, state) {
            return const UserInitKycScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/idukaan/dashboard',
      builder: (context, state) {
        return const DashboardScreen();
      },
    ),
    GoRoute(
      path: '/idukaan/business',
      builder: (context, state) {
        return const BusinessScreen();
      },
    ),
    GoRoute(
      path: '/idukaan/shop',
      builder: (context, state) {
        return const ShopScreen();
      },
    ),
    GoRoute(
      path: '/idukaan/profile',
      builder: (context, state) {
        return const ProfileScreen();
      },
    ),
  ],
);
