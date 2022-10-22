import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static String routeAppend(BuildContext context, String route) {
    try {
      return ModalRoute.of(context)!.settings.name! + route;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return route;
    }
  }
}
