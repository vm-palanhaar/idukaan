class OrgEmpListSObjResMdl {
  final String id;
  final String name;
  bool isMng;
  String exp;
  String jDate;

  OrgEmpListSObjResMdl({
    required this.id,
    required this.name,
    required this.isMng,
    required this.exp,
    required this.jDate,
  });

  factory OrgEmpListSObjResMdl.fromJson(Map<String, dynamic> json) {
    return OrgEmpListSObjResMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      isMng: json["is_manager"] as bool,
      exp: json["exp"] as String,
      jDate: json["join_date"] as String,
    );
  }
}