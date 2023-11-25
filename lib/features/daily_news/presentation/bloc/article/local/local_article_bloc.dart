import 'package:article_news/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:article_news/features/daily_news/domain/usecases/remove_article.dart';
import 'package:article_news/features/daily_news/domain/usecases/save_article.dart';
import 'package:article_news/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:article_news/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._removeArticleUseCase,
      this._saveArticleUseCase)
      : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticles);
    on<SaveArticle>(onSaveArticles);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticlesState> emit) async {
    // getting the data and saved it in articles
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticles(
      RemoveArticle removeArticle, Emitter<LocalArticlesState> emit) async {
    // removing the article
    await _removeArticleUseCase(params: removeArticle.article);
    // getting the data and saved it in articles
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticles(
      SaveArticle saveArticle, Emitter<LocalArticlesState> emit) async {
    // saving the article
    await _saveArticleUseCase(params: saveArticle.article);
    // getting the data and saved it in articles
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
