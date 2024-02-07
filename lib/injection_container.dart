// ignore_for_file: depend_on_referenced_packages

import 'package:bakery_app/core/constants/constants.dart';
import 'package:bakery_app/features/data/data_sources/remote/auth_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/dough_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/product_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/service_account_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/service_debt_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/service_services_service.dart';
import 'package:bakery_app/features/data/repositories/auth_repository_impl.dart';
import 'package:bakery_app/features/data/repositories/dough_repository_impl.dart';
import 'package:bakery_app/features/data/repositories/product_repository_impl.dart';
import 'package:bakery_app/features/data/repositories/service_account_repository_impl.dart';
import 'package:bakery_app/features/domain/repositories/auth_repository.dart';
import 'package:bakery_app/features/domain/repositories/dough_repository.dart';
import 'package:bakery_app/features/domain/repositories/product_repository.dart';
import 'package:bakery_app/features/domain/repositories/service_account_repository.dart';
import 'package:bakery_app/features/domain/repositories/service_market_repository.dart';
import 'package:bakery_app/features/domain/usecases/dough_factory_usecases.dart';
import 'package:bakery_app/features/domain/usecases/product_usecase.dart';
import 'package:bakery_app/features/domain/usecases/service_account_usecases.dart';
import 'package:bakery_app/features/domain/usecases/service_market_usecase.dart';
import 'package:bakery_app/features/domain/usecases/user_login_usecase.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_account_left/service_account_left_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_added_markets/service_added_markets_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_lists/service_lists_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_markets/service_markets_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_stale_left/service_stale_left_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_stale_received/service_stale_received_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/data/data_sources/remote/service_stale_service.dart';
import 'features/data/repositories/service_debt_repository_impl.dart';
import 'features/data/repositories/service_market_repository_impl.dart';
import 'features/data/repositories/service_stale_repository_impl.dart';
import 'features/domain/repositories/service_debt_repository.dart';
import 'features/domain/repositories/service_stale_repository.dart';
import 'features/domain/usecases/service_debt_usecase.dart';
import 'features/domain/usecases/service_stale_usecase.dart';
import 'features/presentation/pages/auth/bloc/auth_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_added_products/dough_added_products_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_lists/dough_factory_bloc.dart';
import 'features/presentation/pages/dough/bloc/dough_products/dough_products_bloc.dart';
import 'features/presentation/pages/production/bloc/added_products/added_product_bloc.dart';
import 'features/presentation/pages/production/bloc/products/product_bloc.dart';
import 'features/presentation/pages/service/bloc/service_account_received/service_account_received_bloc.dart';
import 'features/presentation/pages/service/bloc/service_debt/service_debt_bloc.dart';
import 'features/presentation/pages/service/bloc/service_debt_detail/service_debt_detail_bloc.dart';

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
  sl.registerSingleton<ServiceServicesApiService>(
      ServiceServicesApiService(sl()));
  sl.registerSingleton<ServiceMarketRepository>(
      ServiceMarketRepositoryImpl(sl()));
  sl.registerSingleton<ServiceAccountService>(ServiceAccountService(sl()));
  sl.registerSingleton<ServiceAccountRepository>(ServiceAccountRepositoryImpl(sl()));
    sl.registerSingleton<ServiceStaleService>(ServiceStaleService(sl()));
  sl.registerSingleton<ServiceStaleRepository>(ServiceStaleRepositoryImpl(sl()));
  sl.registerSingleton<ServiceDebtApiService>(ServiceDebtApiService(sl()));
  sl.registerSingleton<ServiceDebtRepository>(ServiceDebtRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<AuthUseCase>(AuthUseCase(sl()));
  sl.registerSingleton<DoughUseCase>(DoughUseCase(sl()));
  sl.registerSingleton<ProductUseCase>(ProductUseCase(sl()));
  sl.registerSingleton<ServiceMarketUseCase>(ServiceMarketUseCase(sl()));
  sl.registerSingleton<ServiceAccountUseCase>(ServiceAccountUseCase(sl()));
  sl.registerSingleton<ServiceStaleUseCase>(ServiceStaleUseCase(sl()));
  sl.registerSingleton<ServiceDebtUseCase>(ServiceDebtUseCase(sl()));


  // Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<DoughFactoryBloc>(() => DoughFactoryBloc(sl()));
  sl.registerFactory<DoughAddedProductsBloc>(
      () => DoughAddedProductsBloc(sl()));
  sl.registerFactory<DoughProductsBloc>(() => DoughProductsBloc(sl()));
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
  sl.registerFactory<AddedProductBloc>(() => AddedProductBloc(sl()));
  sl.registerFactory<ServiceListsBloc>(() => ServiceListsBloc(sl()));
  sl.registerFactory<ServiceMarketsBloc>(() => ServiceMarketsBloc(sl()));
  sl.registerFactory<ServiceAddedMarketsBloc>(() => ServiceAddedMarketsBloc(sl()));
  sl.registerFactory<ServiceAccountLeftBloc>(() => ServiceAccountLeftBloc(sl()));
  sl.registerFactory<ServiceAccountReceivedBloc>(() => ServiceAccountReceivedBloc(sl()));
  sl.registerFactory<ServiceStaleLeftBloc>(() => ServiceStaleLeftBloc(sl()));
  sl.registerFactory<ServiceStaleReceivedBloc>(() => ServiceStaleReceivedBloc(sl()));
  sl.registerFactory<ServiceDebtBloc>(() => ServiceDebtBloc(sl()));
  sl.registerFactory<ServiceDebtDetailBloc>(() => ServiceDebtDetailBloc(sl()));
}
