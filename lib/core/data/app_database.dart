import 'dart:async';

import 'package:floor/floor.dart';
import 'package:recipes_app/core/data/daos/recipe_dao.dart';
import 'package:recipes_app/core/data/daos/user_dao.dart';
import 'package:recipes_app/core/data/type_converters/string_list_converter.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/entities/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([StringListConverter])
@Database(version: 2, entities: [Recipe, User])
abstract class AppDatabase extends FloorDatabase {
  RecipeDao get recipeDao;

  UserDao get userDao;
}

Future<AppDatabase> getAppDatabase() async {
  final migration1to2 = Migration(1, 2, (database) async {
    await database.execute(
        'ALTER TABLE recipes ADD COLUMN isFavorite INTEGER DEFAULT 0 NOT NULL');
  });

  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .addMigrations([migration1to2]).build();
  return database;
}
