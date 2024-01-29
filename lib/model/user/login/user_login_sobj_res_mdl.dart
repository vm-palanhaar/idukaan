class UserLoginSObjResMdl {
  final String firstName;
  final String lastName;
  final String username;
  final bool isKyc;

  UserLoginSObjResMdl({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.isKyc,
  });

  factory UserLoginSObjResMdl.fromJson(Map<String, dynamic> json) {
    return UserLoginSObjResMdl(
      firstName: json["firstName"] as String,
      lastName: json["lastName"] as String,
      username: json["username"] as String,
      isKyc: json["isKyc"] as bool,
    );
  }
}
