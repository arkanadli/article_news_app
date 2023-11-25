import 'package:article_news/core/resources/data_state.dart';
import 'package:article_news/core/usecases/usecases.dart';
import 'package:article_news/features/daily_news/domain/entities/article.dart';
import 'package:article_news/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
