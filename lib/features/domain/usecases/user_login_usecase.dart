import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/core/usecases/usecase.dart';
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/domain/entities/user.dart';
import 'package:bakery_app/features/domain/repositories/auth_repository.dart';

class AuthUseCase implements UseCase<DataState<UserEntity>, UserLoginParams> {
  final AuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({UserLoginParams? params}) async{
    return await _authRepository.userLogin(params);
  }
}
