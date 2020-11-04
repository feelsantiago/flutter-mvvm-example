import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mvvm_example/src/models/user.dart';
import 'api_service.dart';

@singleton
class AuthenticationService {
  final Api _api;

  AuthenticationService(Api api) : _api = api;

  User user;

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;

    if (hasUser) {
      this.user = fetchedUser;
    }

    return hasUser;
  }
}
