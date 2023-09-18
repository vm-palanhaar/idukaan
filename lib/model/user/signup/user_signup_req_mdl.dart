class UserSignupReqMdl {
  String _firstName = '';
  String _lastName = '';
  String _contactNo = '';
  String _email = '';
  String _pwd = '';

  set setFirstName(String firstName) => _firstName = firstName;
  set setLastName(String lastName) => _lastName = lastName;
  set setContactNo(String contactNo) => _contactNo = contactNo;
  set setEmail(String email) => _email = email;
  set setPwd(String pwd) => _pwd = pwd;

  get getFirstName => _firstName;
  get getLastName => _lastName;
  get getContactNo => _contactNo;
  get getEmail => _email;
  get getPwd => _pwd;
}
