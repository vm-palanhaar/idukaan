class UserSignupFObjResMdl {
  final String firstName;
  final String lastName;
  final String contactNo;
  final String email;
  final String username;
  final String password;

  UserSignupFObjResMdl({
    required this.firstName,
    required this.lastName,
    required this.contactNo,
    required this.email,
    required this.username,
    required this.password,
  });

  factory UserSignupFObjResMdl.fromJson(Map<String, dynamic> json) {
    return UserSignupFObjResMdl(
      firstName: json.containsKey("firstName")
          ? List<String>.from(json['firstName'] as List).join('\n')
          : '',
      lastName: json.containsKey("lastName")
          ? List<String>.from(json['lastName'] as List).join('\n')
          : '',
      contactNo: json.containsKey("contactNo")
          ? List<String>.from(json['contactNo'] as List).join('\n')
          : '',
      email: json.containsKey("email")
          ? List<String>.from(json['email'] as List).join('\n')
          : '',
      username: json.containsKey("username")
          ? List<String>.from(json['username'] as List).join('\n')
          : '',
      password: json.containsKey("password")
          ? List<String>.from(json['password'] as List).join('\n')
          : '',
    );
  }
}
