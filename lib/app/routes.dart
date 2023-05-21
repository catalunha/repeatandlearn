import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/home/home_page.dart';
import 'features/splash/splash_page.dart';

final goRouterProv = Provider((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: AppPage.splash.path,
      name: AppPage.splash.name,
      builder: (context, state) => SplashPage(
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: AppPage.login.path,
      name: AppPage.login.name,
      builder: (context, state) => LoginPage(
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: AppPage.home.path,
      name: AppPage.home.name,
      builder: (context, state) => HomePage(
        key: state.pageKey,
      ),
    )
  ]);
});

enum AppPage {
  splash('/', 'splash'),
  login('/login', 'login'),
  register('/register/email', 'registerEmail'),
  home('/home', 'splash');

  final String path;
  final String name;
  const AppPage(this.path, this.name);
}
