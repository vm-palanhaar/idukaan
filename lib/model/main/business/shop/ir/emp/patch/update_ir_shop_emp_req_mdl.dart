class UpdateIrShopEmpReqMdl {
  String _id = '';
  String orgId = '';
  String shopId = '';
  bool _isMng = false;
  String _jDate = '';

  String get getId => _id;
  bool get getIsMng => _isMng;
  String get getJDate => _jDate;

  void setId(String id) => _id = id;
  void setIsMng(bool isMng) => _isMng = isMng;
  void setJDate(String jDate) => _jDate = jDate;

  void setInitValues() {
    _id = '';
    orgId = '';
    shopId = '';
    _isMng = false;
    _jDate = '';
  }
}
