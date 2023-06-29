import 'package:dartz/dartz.dart';
import 'package:hackernews/app/search/domain/entities/new_enitity.dart';
import 'package:hackernews/app/search/domain/repositories/news_repository.dart';
import 'package:hackernews/core/error/failure.dart';
import 'package:hackernews/core/use_case/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchUseCase extends UseCase<NewsEnitity, SearchParam> {
  final NewsRepository newsRepository;

  SearchUseCase({required this.newsRepository});
  @override
  Future<Either<Failure, NewsEnitity>> call(SearchParam params) {
    return newsRepository.searchNews(params.searchKey);
  }
}

class SearchParam {
  String searchKey;

  SearchParam(this.searchKey);
}
