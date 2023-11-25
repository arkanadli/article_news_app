import 'package:article_news/core/constants/constants.dart';
import 'package:article_news/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse> getNewsArticle(
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  );
}
