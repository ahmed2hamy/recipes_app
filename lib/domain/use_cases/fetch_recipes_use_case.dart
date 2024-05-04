import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/core/use_case/use_case.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/repositories/recipe_repository.dart';

class FetchRecipes extends UseCase<List<Recipe>, NoParams> {
  final RecipeRepository repository;

  FetchRecipes(this.repository);

  @override
  Future<Either<Failure, List<Recipe>>> call(NoParams params) async {
    return await repository.getAllRecipes();
  }
}
