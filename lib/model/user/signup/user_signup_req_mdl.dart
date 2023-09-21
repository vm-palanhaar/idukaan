class UserSignupReqMdl {
  String _firstName = '';
  String _lastName = '';
  String _contactNo = '';
  String _email = '';
  String _username = '';
  String _pwd = '';

  void setFirstName(String firstName) => _firstName = firstName.trim();
  void setLastName(String lastName) => _lastName = lastName.trim();
  void setContactNo(String contactNo) => _contactNo = contactNo.trim();
  void setEmail(String email) => _email = email.trim();
  void setUsername(String username) => _username = username.trim();
  void setPwd(String pwd) => _pwd = pwd;

  get getFirstName => _firstName;
  get getLastName => _lastName;
  get getContactNo => _contactNo;
  get getEmail => _email;
  get getUsername => _username;
  get getPwd => _pwd;
}
