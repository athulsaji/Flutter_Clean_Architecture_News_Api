import 'dart:io';
import 'package:clean_architecture/src/data/datasources/local/app_database.dart';
import 'package:dio/dio.dart';

import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/articles_repository.dart';
import '../datasources/remote/news_api_service.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  const ArticlesRepositoryImpl(this._newsApiService, this._appDatabase);
  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  ) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        country: params.country,
        category: params.category,
        page: params.page,
        pageSize: params.pageSize,
      );
      print('response: $httpResponse');
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      }
      return DataFailure(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          request: httpResponse.response.request,
          type: DioErrorType.RESPONSE,
        ),
      );
    } on DioError catch (e) {
      print('error: ${e.message}\n error:${e.error}');
      return DataFailure(e);
    }
  }

  @override
  Future<List<Article>> getSavedArticles() async {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removedArticle(Article article) async {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(Article article) async {
    return _appDatabase.articleDao.insertArticle(article);
  }
}
