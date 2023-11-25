import 'dart:io';
import 'package:article_news/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:article_news/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:article_news/core/constants/constants.dart';
import 'package:article_news/core/resources/data_state.dart';
import 'package:article_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:article_news/features/daily_news/data/models/article.dart';
import 'package:article_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:retrofit/retrofit.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImplementation(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
        newsAPIKey,
        countryQuery,
        categoryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        List<ArticleModel> articles =
            (httpResponse.data['articles'] as List<dynamic>)
                .map((e) => ArticleModel.fromJson(e))
                .toList();
        return DataSuccess(articles);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // we are changing from ArticleEntity to ArticleModel because we should not create an object that have class of ArticleEntity
  @override
  Future<List<ArticleModel>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
