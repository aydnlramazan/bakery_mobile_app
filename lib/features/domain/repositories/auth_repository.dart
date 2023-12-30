import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/domain/entities/user.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> userLogin(UserLoginParams? userLoginParams);
  Future<void> userLogout();
}
