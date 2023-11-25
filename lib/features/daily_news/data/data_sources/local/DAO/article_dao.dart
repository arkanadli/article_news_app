import 'package:article_news/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query('Select * FROM article')
  Future<List<ArticleModel>> getArticles();
}
