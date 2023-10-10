class AddIrShopReq4Mdl {
  String _licNo = '';
  String _licDoc = '';
  String _licSd = '';
  String _licEd = '';

  void setLicNo(String licNo) => _licNo = licNo;
  void setLicDoc(String licDoc) => _licDoc = licDoc;
  void setLicSd(String licSd) => _licSd = licSd;
  void setLicEd(String licEd) => _licEd = licEd;

  String get getLicNo => _licNo;
  String get getLicDoc => _licDoc;
  String get getLicSd => _licSd;
  String get getLicEd => _licEd;

  void setInitValues() {
    _licNo = '';
    _licDoc = '';
    _licSd = '';
    _licEd = '';
  }
}
