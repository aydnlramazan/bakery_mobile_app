import 'dart:io';

import 'package:bakery_app/config/routes/router.dart';
import 'package:bakery_app/core/utils/http_overrides.dart';
import 'package:bakery_app/core/utils/shared_preference.dart';
import 'package:bakery_app/features/data/models/user.dart';
import 'package:bakery_app/features/presentation/bloc/dough_factory/dough_factory_bloc.dart';
import 'package:bakery_app/features/presentation/bloc/user_login/auth_bloc.dart';
import 'package:bakery_app/features/presentation/pages/dough_list_page.dart';
import 'package:bakery_app/features/presentation/pages/login_page.dart';
import 'package:bakery_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
   UserModel? savedUser = await  UserPreferences.getUser() ;
  runApp( MyApp(savedUser: savedUser));
}

class MyApp extends StatelessWidget {
  final UserModel? savedUser;
  const MyApp({Key? key,  this.savedUser}) : super(key: key);

  @override
  Widget build(BuildContext context)  {

    return MultiBlocProvider(
      providers:[
         BlocProvider<AuthBloc>(create: (context) =>AuthBloc(sl()),),
         BlocProvider<DoughFactoryBloc>(create: (context) =>DoughFactoryBloc(sl())..add(DoughListsRequested(dateTime: DateTime.now())),),
      ], 
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings)=>generateRoute(settings),
        home: savedUser == null?const LoginPage():const DoughListPage(),
      ),
    );
  }
}
