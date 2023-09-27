class UserLoggedInValidResMdl {
  final String firstName;
  final String lastName;
  final String username;
  final bool isVer;

  UserLoggedInValidResMdl({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.isVer,
  });

  factory UserLoggedInValidResMdl.fromJson(Map<String, dynamic> json) {
    return UserLoggedInValidResMdl(
      firstName: json["first_name"] as String,
      lastName: json["last_name"] as String,
      username: json["username"] as String,
      isVer: json["is_verified"] as bool,
    );
  }
}
