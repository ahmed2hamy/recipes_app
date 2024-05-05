import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/use_case/use_case.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/use_cases/fetch_recipes_use_case.dart';

class RecipesState {
  final List<Recipe> recipes;
  final bool isLoading;
  final String? error;

  RecipesState({this.recipes = const [], this.isLoading = false, this.error});
}

class RecipesCubit extends Cubit<RecipesState> {
  final FetchRecipes _fetchRecipes;

  RecipesCubit(this._fetchRecipes) : super(RecipesState());

  Future<void> loadRecipes({showLoading = true}) async {
    if (showLoading) emit(RecipesState(isLoading: true));
    final result = await _fetchRecipes.call(NoParams());
    result.fold(
      (failure) => emit(RecipesState(error: failure.toString())),
      (recipes) => emit(RecipesState(recipes: recipes)),
    );
  }
}
