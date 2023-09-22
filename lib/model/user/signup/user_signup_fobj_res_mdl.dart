class UserSignupFObjResMdl {
  final List<String> firstName;
  final List<String> lastName;
  final List<String> contactNo;
  final List<String> email;
  final List<String> username;
  final List<String> password;

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
          ? List<String>.from(json['first_name'] as List)
          : [],
      lastName: json.containsKey("last_name")
          ? List<String>.from(json['last_name'] as List)
          : [],
      contactNo: json.containsKey("contact_no")
          ? List<String>.from(json['contact_no'] as List)
          : [],
      email: json.containsKey("email")
          ? List<String>.from(json['email'] as List)
          : [],
      username: json.containsKey("username")
          ? List<String>.from(json['username'] as List)
          : [],
      password: json.containsKey("password")
        ? List<String>.from(json['password'] as List)
        : [],
    );
  }
}
