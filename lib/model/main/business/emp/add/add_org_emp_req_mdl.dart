class AddOrgEmpReqMdl {
  String _org = '';
  String _user = '';
  bool _isMng = false;

  String get getOrg => _org;
  String get getUser => _user;
  bool get getIsMngBool => _isMng;
  String get getIsMng => _isMng.toString();

  void setOrg(String org) => _org = org;
  void setUser(String user) => _user = user;
  void setIsMng(bool isMng) => _isMng = isMng;
}
