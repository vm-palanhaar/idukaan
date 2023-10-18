class AddIrShopEmpReqMdl {
  String orgId = '';
  String shopId = '';
  String _orgEmpId = '';
  bool _isMng = false;
  String _jDate = '';

  String get getOrgEmpId => _orgEmpId;
  bool get getIsMng => _isMng;
  String get getJDate => _jDate;

  void setOrgEmpId(String orgEmpId) => _orgEmpId = orgEmpId;
  void setIsMng(bool isMng) => _isMng = isMng;
  void setJDate(String jDate) => _jDate = jDate;

  void setInitValues() {
    orgId = '';
    shopId = '';
    _orgEmpId = '';
    _isMng = false;
    _jDate = '';
  }
}
