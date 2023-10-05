class AddOrgEmpSObjResMdl {
  final String id;
  final String user;
  final bool isMng;
  final String org;

  AddOrgEmpSObjResMdl({
    required this.id,
    required this.user,
    required this.isMng,
    required this.org,
  });

  factory AddOrgEmpSObjResMdl.fromJson(Map<String, dynamic> json) {
    return AddOrgEmpSObjResMdl(
      id: json["id"] as String,
      user: json["user"] as String,
      isMng: json["is_manager"] as bool,
      org: json["org"].toString(),
    );
  }
}
