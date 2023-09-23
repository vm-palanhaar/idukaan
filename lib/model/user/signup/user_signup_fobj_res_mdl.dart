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
      firstName: json.containsKey("first_name")
          ? List<String>.from(json['first_name'] as List).join('\n')
          : '',
      lastName: json.containsKey("last_name")
          ? List<String>.from(json['last_name'] as List).join('\n')
          : '',
      contactNo: json.containsKey("contact_no")
          ? List<String>.from(json['contact_no'] as List).join('\n')
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
