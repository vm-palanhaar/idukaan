class UserSignupSObjResMdl {
  final String firstName;
  final String lastName;
  final String contactNo;
  final String email;
  final String username;

  UserSignupSObjResMdl({
    required this.firstName,
    required this.lastName,
    required this.contactNo,
    required this.email,
    required this.username,
  });

  factory UserSignupSObjResMdl.fromJson(Map<String, dynamic> json) {
    return UserSignupSObjResMdl(
      firstName: json["first_name"] as String,
      lastName: json["last_name"] as String,
      contactNo: json["contact_no"] as String,
      email: json["email"] as String,
      username: json["username"] as String,
    );
  }
}
