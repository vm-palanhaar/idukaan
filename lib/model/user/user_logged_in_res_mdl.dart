class UserLoggedInResMdl {
  final String firstName;
  final String lastName;
  final String username;
  final bool isVer;

  UserLoggedInResMdl({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.isVer,
  });

  factory UserLoggedInResMdl.fromJson(Map<String, dynamic> json) {
    return UserLoggedInResMdl(
      firstName: json["first_name"] as String,
      lastName: json["last_name"] as String,
      username: json["username"] as String,
      isVer: json["is_verified"] as bool,
    );
  }
}
