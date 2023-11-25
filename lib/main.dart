import 'package:article_news/config/theme/app_themes.dart';
import 'package:article_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:article_news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:article_news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:article_news/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) {
        return sl()..add(const GetArticles());
      },
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const DailyNews(),
      ),
    );
  }
}
