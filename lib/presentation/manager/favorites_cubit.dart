import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/use_case/use_case.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/use_cases/get_favorites_use_case.dart';
import 'package:recipes_app/domain/use_cases/update_favorite_status_use_case.dart';

class FavoritesState {
  final List<Recipe> favoriteRecipes;
  final bool isLoading;
  final String? error;
  final bool favoriteStatusToggled;

  FavoritesState({
    this.favoriteRecipes = const [],
    this.isLoading = false,
    this.error,
    this.favoriteStatusToggled = false,
  });
}

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavorites getFavorites;
  final UpdateFavoriteStatus updateFavoriteStatus;

  FavoritesCubit(
    this.getFavorites,
    this.updateFavoriteStatus,
  ) : super(FavoritesState());

  void toggleFavorite(Recipe recipe) async {
    emit(FavoritesState(isLoading: true));
    final result =
        await updateFavoriteStatus.call(FavoriteParams(recipe: recipe));
    result.fold(
      (failure) => emit(FavoritesState(error: failure.toString())),
      (_) => emit(FavoritesState(favoriteStatusToggled: true)),
    );
  }

  Future<void> loadFavorites() async {
    final result = await getFavorites.call(NoParams());
    result.fold(
      (failure) => emit(FavoritesState(error: failure.toString())),
      (favorites) => emit(FavoritesState(favoriteRecipes: favorites)),
    );
  }
}
