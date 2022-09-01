import 'package:flutter/widgets.dart';
import 'package:projeto01/services/prefes_service.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _password;
  setPassword(String value) => _password = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;
    if (_login == 'admin' && _password == '123') {
      PrefsService.save(_login!);
      return true;
    }
    return false;
  }
}
