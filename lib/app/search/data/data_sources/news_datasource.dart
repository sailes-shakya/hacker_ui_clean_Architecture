import 'package:dio/dio.dart';
import 'package:hackernews/core/utilis/api_utilis.dart';
import 'package:injectable/injectable.dart';

import '../models/news_model.dart';

abstract class NewsDataSource {
  Future<NewsModel> fetchNews(String page);
  Future<NewsModel> searchNews(String searchKey);
}

@LazySingleton(as: NewsDataSource)
class NewsDataSourceImpl implements NewsDataSource {
  const NewsDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<NewsModel> fetchNews(String pageNum) async {
    final response = await dio.get(
      ApiUtils.frontPage(pageNum),
    );
    return NewsModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<NewsModel> searchNews(String searchKey) async {
    final response = await dio.get(
      ApiUtils.searchNews(searchKey),
    );
    return NewsModel.fromJson(response.data as Map<String, dynamic>);
  }
}
