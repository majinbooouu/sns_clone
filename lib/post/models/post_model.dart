import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String description;
  final String creatorUid;
  final String creator;
  final int createdAt;
  final int emojiIndex;
  final DocumentReference? documentReference;

  PostModel({
    required this.description,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
    required this.emojiIndex,
    required this.documentReference,
  });

  PostModel.fromJson(Map<String, dynamic> json, DocumentReference doc)
      : description = json["description"],
        creatorUid = json["creatorUid"],
        creator = json["creator"],
        createdAt = json["createdAt"],
        emojiIndex = json["emojiIndex"],
        documentReference = doc;

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "creatorUid": creatorUid,
      "creator": creator,
      "createdAt": createdAt,
      "emojiIndex": emojiIndex,
      "documentReference": documentReference,
    };
  }
}
