class UpdateOrgEmpReqMdl {
  String _id = '';
  String _org = '';
  bool _isMng = false;
  String _jDate = '';

  String get getId => _id;
  String get getOrg => _org;
  bool get getIsMngBool => _isMng;
  String get getIsMng => _isMng.toString();
  String get getJDate => _jDate;

  void setId(String id) => _id = id;
  void setOrg(String org) => _org = org;
  void setIsMng(bool isMng) => _isMng = isMng;
  void setJDate(String jDate) => _jDate = jDate;

  void setInitValues() {
    _id = '';
    _org = '';
    _isMng = false;
    _jDate = '';
  }
}
