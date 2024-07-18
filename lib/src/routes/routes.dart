import 'package:flutter/material.dart';

import '../features/auth/view/auth_screen.dart';
import '../features/home/view/home_screen.dart';

class AppRoutes {
  static const String authScreen = '/';
  static const String homeScreen = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      authScreen: (context) => SignUpScreen(),
      homeScreen: (context) => const HomeScreen(),
    };
  }
}
