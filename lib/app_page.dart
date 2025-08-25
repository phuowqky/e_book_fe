import 'dart:developer';
import 'package:app_bong_da/core/di/common_features.dart';
import 'package:app_bong_da/data/storage/user_storage.dart';
import 'package:app_bong_da/view/screens/login_screen.dart';
import 'package:app_bong_da/view/screens/signup_screen.dart';
import 'package:app_bong_da/view/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:path/path.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});
  @override
  State<AppPage> createState() => _AppPageState();
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
    retrieveToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      // locale: const Locale('vi', 'VN'),
      localizationsDelegates: const [],
      // supportedLocales: const [
      //   Locale('vi', 'VN'),
      // ],
    );
  }

  void retrieveToken() async {
    final token = await UserStorage.getToken();

    if (token.isNotEmpty) {
      CommonFeatures.setAuthorizationToken(token);
      log("Token restored and set in Dio: $token");
    }
  }

  final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const StartScreen();
        },
      ),
      GoRoute(
          path: '/login_screen',
          builder: (context, state) {
            return LoginScreen();
          }),
      GoRoute(
        path: '/signup_screen',
        builder: (context, state) {
          return SignupScreen();
        },
      ),
    ],
  );
}
