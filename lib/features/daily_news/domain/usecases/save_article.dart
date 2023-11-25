import 'package:article_news/core/resources/data_state.dart';
import 'package:article_news/core/usecases/usecases.dart';
import 'package:article_news/features/daily_news/domain/entities/article.dart';
import 'package:article_news/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
