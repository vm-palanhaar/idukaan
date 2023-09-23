class UserLoginReqMdl {
  String _username = '';
  String _pwd = '';

  void setUsername(String username) => _username = username.trim();
  void setPwd(String pwd) => _pwd = pwd;

  get getUsername => _username;
  get getPwd => _pwd;
}