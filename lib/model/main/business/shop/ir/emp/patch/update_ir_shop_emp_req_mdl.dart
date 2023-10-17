class UpdateIrShopEmpReqMdl {
  String _id = '';
  String _org = '';
  String _shop = '';
  bool _isMng = false;
  String _jDate = '';

  String get getId => _id;
  String get getOrg => _org;
  String get getShop => _shop;
  bool get getIsMngBool => _isMng;
  String get getIsMng => _isMng.toString();
  String get getJDate => _jDate;

  void setId(String id) => _id = id;
  void setOrg(String org) => _org = org;
  void setShop(String shop) => _shop = shop;
  void setIsMng(bool isMng) => _isMng = isMng;
  void setJDate(String jDate) => _jDate = jDate;

  void setInitValues() {
    _id = '';
    _org = '';
    _shop = '';
    _isMng = false;
    _jDate = '';
  }
}