import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:manav_s_application6/presentation/k0_screen/k0_screen.dart';
import 'package:manav_s_application6/presentation/k1_screen/k1_screen.dart';
import 'package:manav_s_application6/presentation/k2_screen/k2_screen.dart';
import 'package:manav_s_application6/presentation/k3_screen/k3_screen.dart';

class AppRoutes {
  // static const String k0Screen = '/k0_screen';

  // static const String k1Screen = '/k1_screen';

  // static const String k2Screen = '/k2_screen';

  // static const String k3Screen = '/k3_screen';

  // static const String appNavigationScreen = '/app_navigation_screen';

  // static Map<String, WidgetBuilder> routes = {
  //   k0Screen: (context) => K0Screen(),
  //   k1Screen: (context) => K1Screen(),
  //   k2Screen: (context) => K2Screen(),
  //   k3Screen: (context) => K3Screen(),
  // };
  static const String k0Screen = '/k0_screen';
static const String k1Screen = '/k1_screen';
static const String k2Screen = '/k2_screen';
static const String k3Screen = '/k3_screen';
static const String appNavigationScreen = '/app_navigation_screen';

static List<GetPage> routes = [
GetPage(name: k0Screen, page: () => K0Screen()),
GetPage(name: k1Screen, page: () => K1Screen()),
GetPage(name: k2Screen, page: () => K2Screen()),
GetPage(name: k3Screen, page: () => K3Screen()),
];
}
