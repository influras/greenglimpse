import 'dart:convert';

class ReelsModel {
  ReelsModel reelsModelFromJson(String str) =>
      ReelsModel.fromJson(json.decode(str));

  String reelsModelToJson(ReelsModel data) => json.encode(data.toJson());
  List<Reels>? reels;

  ReelsModel({this.reels});

  ReelsModel.fromJson(Map<String, dynamic> json) {
    if (json['reels'] != null) {
      reels = <Reels>[];
      json['reels'].forEach((v) {
        reels!.add(Reels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reels != null) {
      data['reels'] = reels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reels {
  String? creator;
  String? description;
  String? mediaUrl;

  Reels({this.creator, this.description, this.mediaUrl});

  Reels.fromJson(Map<String, dynamic> json) {
    creator = json['creator'];
    description = json['description'];
    mediaUrl = json['mediaUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['creator'] = creator;
    data['description'] = description;
    data['mediaUrl'] = mediaUrl;
    return data;
  }
}
