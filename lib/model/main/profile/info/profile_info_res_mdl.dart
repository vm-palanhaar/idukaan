class ProfileInfoResMdl {
  final String fName;
  final String lName;
  final String userName;
  final String email;
  final String contactNo;

  ProfileInfoResMdl({
    required this.fName,
    required this.lName,
    required this.userName,
    required this.email,
    required this.contactNo,
  });

  factory ProfileInfoResMdl.fromJson(Map<String, dynamic> json) {
    return ProfileInfoResMdl(
      fName: json['firstName'] as String,
      lName: json['lastName'] as String,
      userName: json['username'] as String,
      email: json['email'] as String,
      contactNo: json['contactNo'] as String,
    );
  }
}
