
import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/data/data_sources/remote/api.dart';
import 'package:bakery_app/features/domain/entities/user.dart';
import 'package:bakery_app/features/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final api = Api();

  @override
  Future<DataState<UserEntity>> userLogin(
      UserLoginParams? userLoginParams) async {
    try {
      final loginResponse = await api.post("/api/Auth/login",
          queryParameters: userLoginParams?.toMap() ,
          addRequestInterceptor: false,
          );

       final responseData = loginResponse.data;
      if (responseData != null) {
    
        return DataSuccess(responseData);
      } else {
        return DataFailed(DioException(requestOptions: loginResponse.requestOptions));
      }
    
    } catch (e) {
      print('Dio Error: $e');
      throw e;
    }
  }

  @override
  Future<void> userLogout() {
    // TODO: implement userLogout
    throw UnimplementedError();
  }
}
