import 'package:article_news/features/daily_news/domain/entities/article.dart';
import 'package:article_news/features/daily_news/domain/usecases/save_article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticlesEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticlesEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticlesEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticlesEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends LocalArticlesEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}
