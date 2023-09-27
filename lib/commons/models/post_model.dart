class PostModel {
  final String description;
  final String creatorUid;
  final String creator;
  final int createdAt;

  PostModel({
    required this.description,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : description = json["description"],
        creatorUid = json["creatorUid"],
        creator = json["creator"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "creatorUid": creatorUid,
      "creator": creator,
      "createdAt": createdAt,
    };
  }
}
