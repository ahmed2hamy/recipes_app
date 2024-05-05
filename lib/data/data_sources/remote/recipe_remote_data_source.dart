import 'package:recipes_app/constants/constants.dart';
import 'package:recipes_app/core/models/exception.dart';
import 'package:recipes_app/core/network/network_client.dart';
import 'package:recipes_app/data/models/recipe_model.dart';
import 'package:recipes_app/domain/entities/recipe.dart';

abstract class RecipeRemoteDataSource {
  Future<List<Recipe>> getAllRecipes();
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final NetworkClient networkClient;

  RecipeRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<List<Recipe>> getAllRecipes() async {
    try {
      var response = await networkClient.get(kRecipesEndPoint);

      List<Recipe> recipes = [];
      for (var e in (response.data as List)) {
        recipes.add(RecipeModel.fromJson(e));
      }
      return recipes;
    } catch (e) {
      throw ServerException('Error fetching recipes: $e');
    }
  }
}
