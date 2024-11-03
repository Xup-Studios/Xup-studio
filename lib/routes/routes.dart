
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xupstore/views/Developer/dev_profile.dart';

import '../views/dashboard.dart';



class AppRouter {
  static const String devprofile = '/devprofile';
  static const String dashboard = '/dashboard';
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
          settings: const RouteSettings(name: dashboard),
        );
      case devprofile:
        return MaterialPageRoute(
          builder: (context) =>  DevProfile(),
          settings: const RouteSettings(name: devprofile),
        );
      default:
        return null;
    }
  }
}
