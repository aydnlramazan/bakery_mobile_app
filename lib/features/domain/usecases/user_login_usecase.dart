import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/core/usecases/usecase.dart';
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/domain/entities/user.dart';
import 'package:bakery_app/features/domain/repositories/user_repository.dart';

class UserLoginUseCase implements UseCase<DataState<UserEntity>, UserLoginParams> {
  final UserRepository _userRepository;
  UserLoginUseCase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({ UserLoginParams? params}) {
    return _userRepository.userLogin(params!.userName, params.password);
  }
}
