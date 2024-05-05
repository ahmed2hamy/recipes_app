import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/presentation/manager/favorites_cubit.dart';
import 'package:recipes_app/presentation/manager/recipes_cubit.dart';
import 'package:recipes_app/presentation/pages/recipe_details_screen.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.error != null) {
            return Center(
                child: Text('Failed to fetch recipes: ${state.error}'));
          }
          return RefreshIndicator(
            onRefresh: () => context.read<RecipesCubit>().loadRecipes(),
            child: ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) =>
                  _buildRecipeTile(context, state.recipes[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecipeTile(BuildContext context, Recipe recipe) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        isThreeLine: true,
        title: Text(recipe.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${recipe.calories} - ${recipe.time} - ${recipe.fats} - ${recipe.proteins}'),
            Text(recipe.headline, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        leading: Hero(
          tag: 'recipe_image_${recipe.id}',
          child: CircleAvatar(
            backgroundImage: NetworkImage(recipe.image),
            radius: 30,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: recipe.isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            context.read<FavoritesCubit>().toggleFavorite(
                recipe.copyWith(isFavorite: !recipe.isFavorite));
          },
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RecipeDetailsScreen(recipe: recipe),
          ),
        ),
      ),
    );
  }
}
