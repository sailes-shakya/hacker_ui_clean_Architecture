// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'package:hackernews/app/search/domain/entities/new_enitity.dart';

class NewsModel extends NewsEnitity {
  NewsModel({
    super.hits,
    super.nbHits,
    super.page,
    super.nbPages,
    super.hitsPerPage,
    super.exhaustiveNbHits,
    super.exhaustiveTypo,
    super.query,
    super.params,
    super.processingTimeMs,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
        nbHits: json["nbHits"],
        page: json["page"],
        nbPages: json["nbPages"],
        hitsPerPage: json["hitsPerPage"],
        exhaustiveNbHits: json["exhaustiveNbHits"],
        exhaustiveTypo: json["exhaustiveTypo"],
        query: json["query"],
        params: json["params"],
        processingTimeMs: json["processingTimeMS"],
      );

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Hit extends HitEnitity {
  Hit({
    super.createdAt,
    super.title,
    super.url,
    super.author,
    super.points,
    super.storyText,
    super.commentText,
    super.numComments,
    super.storyId,
    super.storyTitle,
    super.storyUrl,
    super.parentId,
    super.createdAtI,
    super.tags,
    super.objectId,
  });

  factory Hit.fromRawJson(String str) => Hit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        title: json["title"],
        url: json["url"],
        author: json["author"],
        points: json["points"],
        storyText: json["story_text"],
        commentText: json["comment_text"],
        numComments: json["num_comments"],
        storyId: json["story_id"],
        storyTitle: json["story_title"],
        storyUrl: json["story_url"],
        parentId: json["parent_id"],
        createdAtI: json["created_at_i"],
        tags: json["_tags"] == null
            ? []
            : List<String>.from(json["_tags"]!.map((x) => x)),
        objectId: json["objectID"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "title": title,
        "url": url,
        "author": author,
        "points": points,
        "story_text": storyText,
        "comment_text": commentText,
        "num_comments": numComments,
        "story_id": storyId,
        "story_title": storyTitle,
        "story_url": storyUrl,
        "parent_id": parentId,
        "created_at_i": createdAtI,
        "_tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "objectID": objectId,
      };
}
