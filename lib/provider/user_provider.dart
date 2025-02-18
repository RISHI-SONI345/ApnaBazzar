import 'package:amazon_clone/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

  User get user => _user;

  void setuser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
