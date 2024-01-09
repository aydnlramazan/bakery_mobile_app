import 'package:bakery_app/features/presentation/pages/dough_list_page.dart';
import 'package:bakery_app/features/presentation/pages/dough_product_page.dart';
import 'package:bakery_app/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const LoginPage());
    case DoughListPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const DoughListPage());
     case DoughProductPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const DoughProductPage());      
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );

  }
}
