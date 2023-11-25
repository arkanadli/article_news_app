import 'package:article_news/features/daily_news/data/data_sources/local/DAO/article_dao.dart';
import 'package:article_news/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';

// IMPORT THIS TO FIX GENERATED FILES
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
// name of the generated files
part 'app_database.g.dart';

// we are using ArticleModel as a entity, cause we have set it before as a entity of the database article table
@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  // adding the getter method
  ArticleDao get articleDao;
}
