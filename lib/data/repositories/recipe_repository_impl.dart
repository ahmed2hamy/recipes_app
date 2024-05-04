import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/core/network/network_info.dart';
import 'package:recipes_app/data/data_sources/local/recipe_local_data_source.dart';
import 'package:recipes_app/data/data_sources/remote/recipe_remote_data_source.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;
  final RecipeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RecipeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Recipe>>> getAllRecipes() async {
    if (await networkInfo.isConnected) {
      try {
        final List<Recipe> remoteRecipes =
            await remoteDataSource.getAllRecipes();
        for (Recipe recipe in remoteRecipes) {
          await localDataSource.insertRecipe(recipe);
        }

        return Right(remoteRecipes);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      try {
        final localRecipes = await localDataSource.getAllRecipes();
        return Right(localRecipes);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }
}
