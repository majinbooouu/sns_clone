class PostModel {
  final String description;
  final String creatorUid;
  final String creator;
  final int createdAt;
  final int emojiIndex;

  PostModel({
    required this.description,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
    required this.emojiIndex,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : description = json["description"],
        creatorUid = json["creatorUid"],
        creator = json["creator"],
        createdAt = json["createdAt"],
        emojiIndex = json["emojiIndex"];

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "creatorUid": creatorUid,
      "creator": creator,
      "createdAt": createdAt,
      "emojiIndex": emojiIndex,
    };
  }
}
