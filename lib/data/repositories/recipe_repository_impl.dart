import 'dart:developer';

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
      return _fetchAndUpdateRecipes();
    } else {
      return _fetchFromLocal();
    }
  }

  Future<Either<Failure, List<Recipe>>> _fetchAndUpdateRecipes() async {
    try {
      final remoteRecipes = await remoteDataSource.getAllRecipes();
      final cachedRecipes = await localDataSource.getFavorites();
      List<Recipe> newRecipes = await _updateLocalDataSource(remoteRecipes, cachedRecipes);
      return Right(newRecipes);
    } catch (e) {
      log('RecipeRepository::fetchAndUpdateRecipes - $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<List<Recipe>> _updateLocalDataSource(
      List<Recipe> remoteRecipes, List<Recipe> cachedRecipes) async {
    List<Recipe> newRecipes = [];

    final cachedIds = cachedRecipes.map((r) => r.id).toSet();
    for (var recipe in remoteRecipes) {
      recipe = recipe.copyWith(
          isFavorite: cachedIds.contains(recipe.id) &&
              cachedRecipes.firstWhere((r) => r.id == recipe.id).isFavorite);
      await localDataSource.insertRecipe(recipe);
      newRecipes.add(recipe);
    }

    return newRecipes;
  }

  Future<Either<Failure, List<Recipe>>> _fetchFromLocal() async {
    try {
      final localRecipes = await localDataSource.getAllRecipes();
      return Right(localRecipes);
    } catch (e) {
      log('RecipeRepository::fetchFromLocal - $e');
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
