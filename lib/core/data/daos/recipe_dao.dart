import 'package:floor/floor.dart';
import 'package:recipes_app/domain/entities/recipe.dart';

@dao
abstract class RecipeDao {
  @Query('SELECT * FROM recipes')
  Future<List<Recipe>> getAllRecipes();

  @Query('SELECT * FROM recipes WHERE id = :id')
  Future<Recipe?> getRecipeById(String id);

  @insert
  Future<void> insertRecipe(Recipe recipe);

  @update
  Future<void> updateRecipe(Recipe recipe);

  @delete
  Future<void> deleteRecipe(Recipe recipe);

  @Query('SELECT * FROM recipes WHERE isFavorite = 1')
  Future<List<Recipe>> getFavoriteRecipes();
}
