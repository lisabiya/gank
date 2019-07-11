import 'package:flutter/material.dart';
import 'package:gank/page/HomePage.dart';

class Router {
  static const String root = "/";
  static const String home = "/home";
  static const String codeView = '/code-view';
  static const String webViewPage = '/web-view-page';

  static void goPage(BuildContext context, String route) {
    switch (route) {
      case root:

      case home:
        homeRoute(context);
        break;
    }
  }

  static void homeRoute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}
