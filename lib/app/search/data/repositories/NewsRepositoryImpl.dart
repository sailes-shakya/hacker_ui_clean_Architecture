import 'package:dartz/dartz.dart';
import 'package:hackernews/app/search/data/data_sources/news_datasource.dart';
import 'package:hackernews/app/search/domain/entities/new_enitity.dart';
import 'package:hackernews/app/search/domain/repositories/news_repository.dart';
import 'package:hackernews/core/error/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl(this.newsDataSource);
  NewsDataSource newsDataSource;

  @override
  Future<Either<Failure, NewsEnitity>> fetchNews(String pageNum) async {
    try {
      final responseCreateGroup = await newsDataSource.fetchNews(pageNum);

      return Right(responseCreateGroup);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NewsEnitity>> searchNews(String searchkey) async {
    try {
      final responseCreateGroup = await newsDataSource.searchNews(searchkey);

      return Right(responseCreateGroup);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
