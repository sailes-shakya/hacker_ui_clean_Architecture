import 'package:dartz/dartz.dart';
import 'package:hackernews/app/search/domain/entities/new_enitity.dart';
import 'package:hackernews/core/error/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsEnitity>> fetchNews(String pageNum);
  Future<Either<Failure, NewsEnitity>> searchNews(String searchkey);
}
