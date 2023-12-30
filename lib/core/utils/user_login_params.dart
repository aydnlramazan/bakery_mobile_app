class UserLoginParams {
  final String userName;
  final String password;

  UserLoginParams({required this.userName, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
    };
  }
}
