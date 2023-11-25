import 'package:article_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:article_news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:article_news/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (context, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticlesError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              // print(state.articles![index].title);
              final currentArticle = state.articles![index];
              return ArticleWidget(
                article: currentArticle,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
