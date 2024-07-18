import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void signIn(String email, String password, BuildContext context) async {
    _setLoading(true);
    try {
      await _authService.signIn(email, password);
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      _setErrorMessage(e.toString());
    }
    _setLoading(false);
  }

  void signUp(
      String name, String email, String password, BuildContext context) async {
    _setLoading(true);
    try {
      await _authService.signUp(name, email, password);
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      _setErrorMessage(e.toString());
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }
}
