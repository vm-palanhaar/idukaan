const String baseUrlApi = 'http://192.168.29.176:8080/api';

//---Users---
enum UserApiUri {
  //PROD
  signup(uri: '$baseUrlApi/user/v1/signup'),
  login(uri: '$baseUrlApi/user/v1/login'),
  validate(uri: '$baseUrlApi/user/v1/validate'),
  logout(uri: '$baseUrlApi/user/v1/logout'),
  logoutAll(uri: '$baseUrlApi/user/v1/logoutAll'),
  //DEV
  doNotUse(uri: '');

  const UserApiUri({
    required this.uri,
  });

  final String uri;
}