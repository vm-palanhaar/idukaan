class IrStationListMdl {
  final String lenSt;
  final List<String> stations;

  IrStationListMdl({
    required this.lenSt,
    required this.stations,
  });

  factory IrStationListMdl.fromJson(Map<String, dynamic> json) {
    return IrStationListMdl(
      lenSt: json['total'] as String,
      stations: List<String>.from(json['stations'] as List),
    );
  }
}
