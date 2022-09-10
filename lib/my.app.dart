import 'package:anime_library/forggotten_password_window/reset_password_window.dart';
import 'package:anime_library/profile/my_profile_view.dart';
import 'package:anime_library/profile/profile.dart';
import 'package:anime_library/register/page/register_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'activation_email/dart/activation_email_page.dart';
import 'forggotten_password_window/forgotten_password_window.dart';
import 'forggotten_password_window/identify_code.dart';
import 'login/page/login_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'GoRouter Example',
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/login',
    routes: <GoRoute>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: '/auth/confirmationEmail/active/:key',
        builder: (BuildContext context, GoRouterState state) {
          return EmailActivationPage(tempKey: state.params['key']!);
        },
      ),
      GoRoute(
        path: '/reset-password',
        builder: (BuildContext context, GoRouterState state) {
          return const ForgottenPasswordWindow();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return const MyProfileView();
        },
      ),
      GoRoute(
        path: '/p',
        builder: (BuildContext context, GoRouterState state) {
          return const ResetPasswordWindow();
        },
      ),
      GoRoute(
        path: '/profile/:username',
        builder: (BuildContext context, GoRouterState state) {
          return Profile(username: state.params['username']!);
        },
      ),
    ],
  );
}
