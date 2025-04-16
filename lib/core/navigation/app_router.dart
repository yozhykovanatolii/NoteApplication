import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:note_application/core/navigation/app_routes.dart';
import 'package:note_application/presentation/page/home/home_page.dart';
import 'package:note_application/presentation/page/manage_categories/manage_categories_page.dart';
import 'package:note_application/presentation/page/splash/splash_page.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  static late final GoRouter router;
  static final GlobalKey<NavigatorState>
  _parentNavigatorKey = GlobalKey<NavigatorState>();

  static AppRouter get instance => _instance;

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal() {
    final routes = [
      GoRoute(
        path: AppRoutes.splashPath,
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: AppRoutes.homePath,
        builder: (context, state) {
          return const HomePage();
        },
      ),

      GoRoute(
        path: AppRoutes.manageCategoriesPath,
        builder: (context, state) {
          return const ManageCategoriesPage();
        },
      ),
    ];
    router = GoRouter(
      initialLocation: AppRoutes.splashPath,
      navigatorKey: _parentNavigatorKey,
      routes: routes,
    );
  }
}
