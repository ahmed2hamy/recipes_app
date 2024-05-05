import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/presentation/manager/favorites_cubit.dart';
import 'package:recipes_app/presentation/pages/recipe_details_screen.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  const FavoriteRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoritesCubit>().loadFavorites();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Recipes"),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.favoriteRecipes.isEmpty) {
            return const Center(child: Text("No favorite recipes"));
          } else {
            return RefreshIndicator(
              onRefresh: () => context.read<FavoritesCubit>().loadFavorites(),
              child: ListView.builder(
                itemCount: state.favoriteRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = state.favoriteRecipes[index];
                  return Dismissible(
                    key: Key(recipe.id),
                    onDismissed: (direction) {
                      context
                          .read<FavoritesCubit>()
                          .toggleFavorite(recipe.copyWith(isFavorite: false));
                    },
                    background: Container(color: Colors.red),
                    child: Card(
                      child: ListTile(
                        leading: Hero(
                          tag: 'recipe_image_${recipe.id}',
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(recipe.image),
                            radius: 30,
                          ),
                        ),
                        title: Text(recipe.name),
                        subtitle: Text('Calories: ${recipe.calories}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => context
                              .read<FavoritesCubit>()
                              .toggleFavorite(
                                  recipe.copyWith(isFavorite: false)),
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RecipeDetailsScreen(recipe: recipe),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
