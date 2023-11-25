import 'package:article_news/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  // For equatables purposes
  List<Object?> get props => [articles!, error!];
}

// when the state is loading
class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

// when the state is done and receiving data articles
class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}

// when the state is error and receiving an error message
class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
