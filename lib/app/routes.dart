import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/authentication/riverpod/auth_prov.dart';
import 'core/authentication/riverpod/auth_state.dart';
import 'features/error/error_page.dart';
import 'features/home/home_page.dart';
import 'features/splash/splash_page.dart';
import 'features/user/login/user_login_page.dart';
import 'features/user/register/email/user_register_email.page.dart';

final goRouterProv = Provider<GoRouter>(
  (ref) {
    final authChNotProvIR = ref.read(authChNotProv);
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: AppPage.splash.path,
      refreshListenable: authChNotProvIR,
      redirect: (context, state) {
        final authStatus = authChNotProvIR.status;
        log('+++ redirect');
        log('state.location: ${state.location}');
        log('authStatusStProvIR: $authStatus');

        if (authStatus == AuthStatus.unauthenticated &&
            state.location != '/login/register_email') {
          log('--- redirected to login');
          return AppPage.login.path;
        }
        if (authStatus == AuthStatus.authenticated &&
            (state.location == AppPage.login.path ||
                state.location == AppPage.splash.path)) {
          log('--- redirected to home');
          return AppPage.home.path;
        }
        log('--- redirected to ${state.location}');

        return null;
      },
      routes: [
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
            builder: (context, state) => UserLoginPage(
                  key: state.pageKey,
                ),
            routes: [
              GoRoute(
                path: AppPage.registerEmail.path,
                name: AppPage.registerEmail.name,
                builder: (context, state) => UserRegisterEmailPage(
                  key: state.pageKey,
                ),
              ),
            ]),
        GoRoute(
          path: AppPage.home.path,
          name: AppPage.home.name,
          builder: (context, state) => HomePage(
            key: state.pageKey,
          ),
        )
      ],
      errorBuilder: (context, state) => ErrorPage(
        key: state.pageKey,
        errorMsg: state.error.toString(),
      ),
    );
  },
);

enum AppPage {
  splash('/', 'splash'),
  login('/login', 'login'),
  registerEmail('registerEmail', 'registerEmail'), // /login/registerEmail
  home('/home', 'home');

  final String path;
  final String name;
  const AppPage(this.path, this.name);
}
