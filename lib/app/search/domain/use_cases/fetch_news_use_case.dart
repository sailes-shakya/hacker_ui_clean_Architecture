import 'package:dartz/dartz.dart';
import 'package:hackernews/app/search/domain/entities/new_enitity.dart';
import 'package:hackernews/app/search/domain/repositories/news_repository.dart';
import 'package:hackernews/core/error/failure.dart';
import 'package:hackernews/core/use_case/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchNewsUseCase extends UseCase<NewsEnitity, Param> {
  final NewsRepository newsRepository;

  FetchNewsUseCase({required this.newsRepository});
  @override
  Future<Either<Failure, NewsEnitity>> call(Param params) {
    return newsRepository.fetchNews(params.pageNum);
  }
}

class Param {
  String pageNum;

  Param(this.pageNum);
}
