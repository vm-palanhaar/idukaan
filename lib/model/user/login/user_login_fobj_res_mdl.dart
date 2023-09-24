class UserLoginFObjResMdl {
  final String username;
  final String password;

  UserLoginFObjResMdl({
    required this.username,
    required this.password,
  });

  factory UserLoginFObjResMdl.fromJson(Map<String, dynamic> json) {
    return UserLoginFObjResMdl(
      username: json.containsKey("username")
          ? List<String>.from(json['username'] as List).join('\n')
          : '',
      password: json.containsKey("password")
          ? List<String>.from(json['password'] as List).join('\n')
          : '',
    );
  }
}
