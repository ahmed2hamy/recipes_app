import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/domain/entities/recipe.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<Recipe>>> getAllRecipes();
}
