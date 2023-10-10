class AddIrShopReq3Mdl {
  String _station = '';
  static const  List<String> pltTypes = [
    'Single Platform',
    'Island Platform',
    'No Platform',
  ];
  String _pltType = pltTypes.first;
  String _plt1 = '';
  String _plt2 = '';
  String _lat = '';
  String _lon = '';

  void setStation(String station) => _station = station;
  void setPltType(String pltType) => _pltType = pltType;
  void setPlt1(String plt1) => _plt1 = plt1;
  void setPlt2(String plt2) => _plt2 = plt2;
  void setLat(String lat) => _lat = lat;
  void setLon(String lon) => _lon = lon;

  String get getStation => _station;
  List<String> get getPltTypes => pltTypes;
  String get getPltType => _pltType;
  String get getPlt1 => _plt1;
  String get getPlt2 => _plt2;
  String get getLat => _lat;
  String get getLon => _lon;

  void setInitValues() {
    _station = '';
    _pltType = pltTypes.first;
    _plt1 = '';
    _plt2 = '';
    _lat = '';
    _lon = '';
  }
}
