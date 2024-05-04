import 'package:recipes_app/core/data/app_database.dart';
import 'package:recipes_app/domain/entities/recipe.dart';

abstract class RecipeLocalDataSource {
  Future<List<Recipe>> getAllRecipes();

  Future<Recipe?> getRecipeById(String id);

  Future<void> insertRecipe(Recipe recipe);

  Future<void> updateRecipe(Recipe recipe);

  Future<void> deleteRecipe(String id);

  Future<List<Recipe>> getFavorites();
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final AppDatabase database;

  RecipeLocalDataSourceImpl(this.database);

  @override
  Future<List<Recipe>> getAllRecipes() async {
    final recipeDao = database.recipeDao;
    final recipes = await recipeDao.getAllRecipes();
    return recipes;
  }

  @override
  Future<Recipe?> getRecipeById(String id) async {
    final recipeDao = database.recipeDao;
    final recipe = await recipeDao.getRecipeById(id);
    if (recipe != null) {
      return recipe;
    }
    return null;
  }

  @override
  Future<void> insertRecipe(Recipe recipe) async {
    final recipeDao = database.recipeDao;
    await recipeDao.insertRecipe(recipe);
  }

  @override
  Future<void> updateRecipe(Recipe recipe) async {
    final recipeDao = database.recipeDao;
    await recipeDao.updateRecipe(recipe);
  }

  @override
  Future<void> deleteRecipe(String id) async {
    final recipeDao = database.recipeDao;
    final recipe = await recipeDao.getRecipeById(id);
    if (recipe != null) {
      await recipeDao.deleteRecipe(recipe);
    }
  }

  @override
  Future<List<Recipe>> getFavorites() async {
    final List<Recipe> recipes = await database.recipeDao.getFavoriteRecipes();
    return recipes;
  }
}
