class AddOrgEmpReqMdl {
  String _org = '';
  String _user = '';
  bool _isMng = false;
  String _jDate = '';

  String get getOrg => _org;
  String get getUser => _user;
  bool get getIsMngBool => _isMng;
  String get getIsMng => _isMng.toString();
  String get getJDate => _jDate;

  void setOrg(String org) => _org = org;
  void setUser(String user) => _user = user;
  void setIsMng(bool isMng) => _isMng = isMng;
  void setJDate(String jDate) => _jDate = jDate;

  void setInitValues() {
    _org = '';
    _user = '';
    _isMng = false;
    _jDate = '';
  }
}
