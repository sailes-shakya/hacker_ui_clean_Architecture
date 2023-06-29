// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'package:equatable/equatable.dart';

class NewsEnitity extends Equatable {
  final List<HitEnitity>? hits;
  final int? nbHits;
  final int? page;
  final int? nbPages;
  final int? hitsPerPage;
  final bool? exhaustiveNbHits;
  final bool? exhaustiveTypo;
  final String? query;
  final String? params;
  final int? processingTimeMs;

  const NewsEnitity({
    this.hits,
    this.nbHits,
    this.page,
    this.nbPages,
    this.hitsPerPage,
    this.exhaustiveNbHits,
    this.exhaustiveTypo,
    this.query,
    this.params,
    this.processingTimeMs,
  });

  @override
  List<Object?> get props => [hits, page];
}

class HitEnitity extends Equatable {
  final DateTime? createdAt;
  final String? title;
  final String? url;
  final String? author;
  final int? points;
  final dynamic storyText;
  final dynamic commentText;
  final int? numComments;
  final dynamic storyId;
  final dynamic storyTitle;
  final dynamic storyUrl;
  final dynamic parentId;
  final int? createdAtI;
  final List<String>? tags;
  final String? objectId;

  const HitEnitity({
    this.createdAt,
    this.title,
    this.url,
    this.author,
    this.points,
    this.storyText,
    this.commentText,
    this.numComments,
    this.storyId,
    this.storyTitle,
    this.storyUrl,
    this.parentId,
    this.createdAtI,
    this.tags,
    this.objectId,
  });

  @override
  List<Object?> get props => [title, points];
}
