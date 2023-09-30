class OrgTypesMdl {
  final String id;
  final String entity;
  final String docType;
  final String desc;

  OrgTypesMdl({
    required this.id,
    required this.entity,
    required this.docType,
    required this.desc,
  });

  factory OrgTypesMdl.fromJson(Map<String, dynamic> json) {
    return OrgTypesMdl(
      id: json["id"] as String,
      entity: json["entity"] as String,
      docType: json["doc"] as String,
      desc: json["desc"] as String,
    );
  }
}