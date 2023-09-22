const String baseUrlApi = 'http://192.168.29.176:8080/api';

//---Users---
enum UserApiUri {
  //PROD
  signup(uri: '$baseUrlApi/user/v1/signup'),
  //DEV
  doNotUse(uri: '');

  const UserApiUri({
    required this.uri,
  });

  final String uri;
}