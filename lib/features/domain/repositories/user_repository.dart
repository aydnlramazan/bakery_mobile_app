import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> userLogin(String userName, String password);
}
