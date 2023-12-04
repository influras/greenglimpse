import 'dart:convert';

ReelsModel reelsModelFromJson(String str) =>
    ReelsModel.fromJson(json.decode(str));

String shortsModelToJson(ReelsModel data) => json.encode(data.toJson());

class ReelsModel {
  final Data data;

  ReelsModel({
    required this.data,
  });

  factory ReelsModel.fromJson(Map<String, dynamic> json) => ReelsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final List<Post> posts;
  Data({
    required this.posts,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Post {
  final String creator;
  final Reel submission;

  Post({
    required this.creator,
    required this.submission,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        creator: json["creator"],
        submission: Reel.fromJson(json["reel"]),
      );

  Map<String, dynamic> toJson() => {
        "creator": creator,
        "submission": submission.toJson(),
      };
}

class Comment {
  final int count;
  final bool commentingAllowed;

  Comment({
    required this.count,
    required this.commentingAllowed,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        count: json["count"],
        commentingAllowed: json["commentingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "commentingAllowed": commentingAllowed,
      };
}

class Reaction {
  int count;
  final bool voted;

  Reaction({
    required this.count,
    required this.voted,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        count: json["count"],
        voted: json["voted"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "voted": voted,
      };
}

class Reel {
  final Title title;
  final String description;
  final String mediaUrl;

  Reel({
    required this.title,
    required this.description,
    required this.mediaUrl,
  });

  factory Reel.fromJson(Map<String, dynamic> json) => Reel(
        title: titleValues.map[json["title"]]!,
        description: json["description"],
        mediaUrl: json["mediaUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "description": description,
        "mediaUrl": mediaUrl,
      };
}

enum Title { Test_TITLE }

final titleValues = EnumValues({"Test Title": Title.Test_TITLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
