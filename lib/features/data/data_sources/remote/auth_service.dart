
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/data/models/user.dart';
import 'package:retrofit/retrofit.dart';



@RestApi()
abstract class AuthApiService {
  Future<HttpResponse<UserModel>> loginUser(UserLoginParams userLoginParams);
  Future<HttpResponse> logoutUser();
}
