import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String name = '';
  String email = '';

  void setUser(String name, String email) {
    this.name = name;
    this.email = email;
    notifyListeners();
  }

  void clearUser() {
    this.name = '';
    this.email = '';
    notifyListeners();
  }

  String get getName => name;
  String get getEmail => email;
}
