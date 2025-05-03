import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';

import '../register.dart';



class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:{

      }
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
