// ignore_for_file: depend_on_referenced_packages

import 'package:bakery_app/features/data/data_sources/remote/auth_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/dough_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/product_service.dart';
import 'package:bakery_app/features/data/repositories/auth_repository_impl.dart';
import 'package:bakery_app/features/data/repositories/dough_repository_impl.dart';
import 'package:bakery_app/features/data/repositories/product_repository_impl.dart';
import 'package:bakery_app/features/domain/repositories/auth_repository.dart';
import 'package:bakery_app/features/domain/repositories/dough_repository.dart';
import 'package:bakery_app/features/domain/repositories/product_repository.dart';
import 'package:bakery_app/features/domain/usecases/dough_factory_usecases.dart';
import 'package:bakery_app/features/domain/usecases/product_usecase.dart';
import 'package:bakery_app/features/domain/usecases/user_login_usecase.dart';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/presentation/pages/auth/bloc/auth_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_added_products/dough_added_products_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_lists/dough_factory_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_products/dough_products_bloc.dart';
import 'features/presentation/pages/production/bloc/added_products/added_product_bloc.dart';
import 'features/presentation/pages/production/bloc/products/product_bloc.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  //sl.registerSingleton<Api>(Api());
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<DoughApiService>(DoughApiService(sl()));
  sl.registerSingleton<DoughRepository>(DoughRepositoryImpl(sl()));
  sl.registerSingleton<ProductApiService>(ProductApiService(sl()));
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<AuthUseCase>(AuthUseCase(sl()));
  sl.registerSingleton<DoughUseCase>(DoughUseCase(sl()));
  sl.registerSingleton<ProductUseCase>(ProductUseCase(sl()));

  // Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<DoughFactoryBloc>(() => DoughFactoryBloc(sl()));
  sl.registerFactory<DoughAddedProductsBloc>(() => DoughAddedProductsBloc(sl()));
  sl.registerFactory<DoughProductsBloc>(() => DoughProductsBloc(sl()));
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
  sl.registerFactory<AddedProductBloc>(() => AddedProductBloc(sl()));
}
