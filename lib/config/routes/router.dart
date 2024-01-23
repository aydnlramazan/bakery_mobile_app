import 'package:bakery_app/features/presentation/pages/auth/screens/login_page.dart';
import 'package:bakery_app/features/presentation/pages/dough/screens/dough_list_page.dart';
import 'package:bakery_app/features/presentation/pages/dough/screens/dough_product_page.dart';
import 'package:bakery_app/features/presentation/pages/production/screens/production_page.dart';
import 'package:bakery_app/features/presentation/pages/service/ServiceListPage.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const LoginPage());
    case ProductionPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ProductionPage());

    case ServiceListPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ServiceListPage());
    case DoughListPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const DoughListPage());
    case DoughProductPage.routeName:
      var args = routeSettings.arguments as Map<int, dynamic>;

      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => DoughProductPage(
                listId: args[0],
                canEdit: args[1],
              ));
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
