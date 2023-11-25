import 'dart:io';
import 'package:dio/dio.dart';
import 'package:article_news/core/constants/constants.dart';
import 'package:article_news/core/resources/data_state.dart';
import 'package:article_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:article_news/features/daily_news/data/models/article.dart';
import 'package:article_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:retrofit/retrofit.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImplementation(this._newsApiService);

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
}
