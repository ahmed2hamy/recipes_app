import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/domain/entities/recipe.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, void>> addFavorite(Recipe recipe);

  Future<Either<Failure, void>> removeFavorite(String recipeId);

  Future<Either<Failure, List<Recipe>>> getFavorites();
}
