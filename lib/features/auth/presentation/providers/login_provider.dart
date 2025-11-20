import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:respi/features/Users/data/models/Users.dart';

class LoginProvider extends ChangeNotifier {
  final List<User> _login = [];

  List<User> get users => _login;

  void addUser() {}
}
