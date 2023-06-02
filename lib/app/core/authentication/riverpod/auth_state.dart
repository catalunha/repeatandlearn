import 'package:flutter/material.dart';

import '../../models/user_model.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
  databaseError,
}

class AuthChNot extends ChangeNotifier {
  AuthStatus _status = AuthStatus.unknown;
  UserModel? _user;
  // final bool _isLoggedIn = false;

  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    if (_user == null) {
      _status = AuthStatus.unauthenticated;
    } else {
      _status = AuthStatus.authenticated;
    }
    notifyListeners();
  }

  // bool get isLoggedIn => _isLoggedIn;
  // set isLoggedIn(bool value) {
  //   _isLoggedIn = value;
  //   if (_isLoggedIn) {
  //     status = AuthStatus.authenticated;
  //   } else {
  //     status = AuthStatus.unauthenticated;
  //   }
  //   notifyListeners();
  // }

  AuthStatus get status => _status;
  set status(AuthStatus value) {
    _status = value;
    notifyListeners();
  }

  void logout() {
    _user = null;
    status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
