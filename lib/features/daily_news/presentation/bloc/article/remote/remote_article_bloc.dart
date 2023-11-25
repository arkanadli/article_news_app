import 'package:article_news/core/resources/data_state.dart';
import 'package:article_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:article_news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:article_news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emitter) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
