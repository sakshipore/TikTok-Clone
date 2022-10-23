import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String username;
  String uid;
  String thumbnail;
  String caption;
  int commentsCount;
  String id;
  List likes;
  String profilePic;
  int shareCount;
  String songName;
  String videoUrl;

  Video({
    required this.username,
    required this.uid,
    required this.thumbnail,
    required this.caption,
    required this.commentsCount,
    required this.id,
    required this.likes,
    required this.profilePic,
    required this.shareCount,
    required this.songName,
    required this.videoUrl,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "thumbnail": thumbnail,
        "caption": caption,
        "commentsCount": commentsCount,
        "id": id,
        "likes": likes,
        "profilePic": profilePic,
        "shareCount": shareCount,
        "songName": songName,
        "videoUrl": videoUrl,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
      username: snapshot["username"],
      uid: snapshot["uid"],
      thumbnail: snapshot["thumbnail"],
      caption: snapshot["caption"],
      commentsCount: snapshot["commentsCount"],
      id: snapshot["id"],
      likes: snapshot["likes"],
      profilePic: snapshot["profilePic"],
      shareCount: snapshot["shareCount"],
      songName: snapshot["songName"],
      videoUrl: snapshot["videoUrl"],
    );
  }
}
