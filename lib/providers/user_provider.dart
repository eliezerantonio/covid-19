import 'package:covid_19_cases/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> login(User user) async {
    String email = user.email;
    String password = user.password;

    if (email == "digistarts@gmail.com" && password == "Digistarts") {
      loading = true;
      await Future.delayed(
        const Duration(seconds: 4),
      );
      loading = false;

      return true;
    } else {
      return false;
    }
  }
}
