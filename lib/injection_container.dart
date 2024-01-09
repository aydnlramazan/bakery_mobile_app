import 'package:bakery_app/features/data/data_sources/remote/auth_service.dart';
import 'package:bakery_app/features/data/data_sources/remote/dough_service.dart';
import 'package:bakery_app/features/data/repositories/auth_repository_impl.dart';
import 'package:bakery_app/features/data/repositories/dough_repository_impl.dart';
import 'package:bakery_app/features/domain/repositories/auth_repository.dart';
import 'package:bakery_app/features/domain/repositories/dough_repository.dart';
import 'package:bakery_app/features/domain/usecases/dough_factory_usecases.dart';
import 'package:bakery_app/features/domain/usecases/user_login_usecase.dart';
import 'package:bakery_app/features/presentation/bloc/dough_factory/dough_factory_bloc.dart';
import 'package:bakery_app/features/presentation/bloc/user_login/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  //sl.registerSingleton<Api>(Api());
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<DoughApiService>(DoughApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<DoughRepository>(DoughRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<AuthUseCase>(AuthUseCase(sl()));
  sl.registerSingleton<DoughUseCase>(DoughUseCase(sl()));

  // Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<DoughFactoryBloc>(() => DoughFactoryBloc(sl()));
}
