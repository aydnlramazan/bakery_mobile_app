import 'dart:io';

import 'package:bakery_app/config/routes/router.dart';
import 'package:bakery_app/config/theme/app_theme.dart';
import 'package:bakery_app/core/utils/http_overrides.dart';
import 'package:bakery_app/features/data/data_sources/local/shared_preference.dart';
import 'package:bakery_app/features/data/models/user.dart';

import 'package:bakery_app/features/presentation/pages/auth/screens/login_page.dart';
import 'package:bakery_app/features/presentation/pages/dough/screens/dough_list_page.dart';
import 'package:bakery_app/features/presentation/pages/production/screens/production_page.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_added_markets/service_added_markets_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_lists/service_lists_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_markets/service_markets_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/screens/service_lists_page.dart';
import 'package:bakery_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/presentation/pages/auth/bloc/auth_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_added_products/dough_added_products_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_lists/dough_factory_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_products/dough_products_bloc.dart';
import 'features/presentation/pages/production/bloc/added_products/added_product_bloc.dart';
import 'features/presentation/pages/production/bloc/products/product_bloc.dart';
import 'features/presentation/pages/service/bloc/service_account_left/service_account_left_bloc.dart';
import 'features/presentation/pages/service/bloc/service_account_received/service_account_received_bloc.dart';
import 'features/presentation/pages/service/bloc/service_stale_left/service_stale_left_bloc.dart';
import 'features/presentation/pages/service/bloc/service_stale_received/service_stale_received_bloc.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  UserModel? savedUser = await UserPreferences.getUser();

  runApp(MyApp(savedUser: savedUser));
}

class MyApp extends StatelessWidget {
  final UserModel? savedUser;
  const MyApp({Key? key, this.savedUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(sl()),
        ),
        BlocProvider<DoughFactoryBloc>(
          create: (context) => DoughFactoryBloc(sl()),
        ),
        BlocProvider<DoughAddedProductsBloc>(
          create: (context) => DoughAddedProductsBloc(sl()),
        ),
        BlocProvider<DoughProductsBloc>(
          create: (context) => DoughProductsBloc(sl()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(sl()),
        ),
        BlocProvider<AddedProductBloc>(
          create: (context) => AddedProductBloc(sl()),
        ),
        BlocProvider<ServiceListsBloc>(
          create: (context) => ServiceListsBloc(sl()),
        ),
        BlocProvider<ServiceMarketsBloc>(
          create: (context) => ServiceMarketsBloc(sl()),
        ),
        BlocProvider<ServiceAddedMarketsBloc>(
          create: (context) => ServiceAddedMarketsBloc(sl()),
        ),
        BlocProvider<ServiceAccountLeftBloc>(
          create: (context) => ServiceAccountLeftBloc(sl()),
        ),
        BlocProvider<ServiceAccountReceivedBloc>(
          create: (context) => ServiceAccountReceivedBloc(sl()),
        ),
              BlocProvider<ServiceStaleLeftBloc>(
          create: (context) => ServiceStaleLeftBloc(sl()),
        ),
        BlocProvider<ServiceStaleReceivedBloc>(
          create: (context) => ServiceStaleReceivedBloc(sl()),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('tr')],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: determineHomePage(savedUser),
      ),
    );
  }

  Widget determineHomePage(UserModel? savedUser) {
    if (savedUser == null) {
      return const LoginPage();
    }

    switch (savedUser.operationClaim) {
      case 1:
        return const DoughListPage();
      case 2:
        return ProductionPage(user: savedUser);
      case 3:
        return ProductionPage(user: savedUser);
      case 4:
        return const ServiceListPage();
      default:
        // Handle any other cases or show a default page
        return const LoginPage();
    }
  }
}
