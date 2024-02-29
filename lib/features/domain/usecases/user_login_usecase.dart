import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/domain/entities/user.dart';
import 'package:bakery_app/features/domain/repositories/auth_repository.dart';

class AuthUseCase  {
  final AuthRepository _authRepository;
  AuthUseCase(this._authRepository);


  Future<DataState<UserEntity?>> userLogin({UserLoginParams? params}) async{
    return await _authRepository.userLogin(params);
  }
}
