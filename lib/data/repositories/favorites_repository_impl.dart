import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/data/data_sources/local/recipe_local_data_source.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final RecipeLocalDataSource localDataSource;

  FavoritesRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> addFavorite(Recipe recipe) async {
    try {
      await localDataSource.insertRecipe(recipe);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(String recipeId) async {
    try {
      await localDataSource.deleteRecipe(recipeId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> getFavorites() async {
    try {
      final recipes = await localDataSource.getFavorites();
      return Right(recipes);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
