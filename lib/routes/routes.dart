import 'package:demo/screens/enquiry_screen.dart';
import 'package:demo/screens/home_screen.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case '/enquiry':
        return MaterialPageRoute(
            builder: (context) => EnquiryScreen(argument: args));

      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
