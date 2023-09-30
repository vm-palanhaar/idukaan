class AddOrgSObjResMdl {
  final int id;
  final String name;
  final int type;

  AddOrgSObjResMdl({
    required this.id,
    required this.name,
    required this.type,
  });

  factory AddOrgSObjResMdl.fromJson(Map<String, dynamic> json) {
    return AddOrgSObjResMdl(
      id: json["id"] as int,
      name: json["name"] as String,
      type: json["type"] as int,
    );
  }
}
