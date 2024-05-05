import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:recipes_app/domain/entities/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            snap: false,
            leading: IconButton(
              icon: Icon(
                Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.maybePop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.name),
              background: Hero(
                tag: 'recipe_image_${recipe.id}',
                child: Image.network(
                  recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.headline,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Details',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text('Calories: ${recipe.calories}'),
                  Text('Time to cook: ${recipe.time}'),
                  Text('Fats: ${recipe.fats}'),
                  Text('Carbohydrates: ${recipe.carbos}'),
                  Text('Fibers: ${recipe.fibers}'),
                  Text('Proteins: ${recipe.proteins}'),
                  Text('Country: ${recipe.country}'),
                  Text(
                      'Difficulty: ${recipe.difficulty == 0 ? "Easy" : "Hard"}'),
                  const SizedBox(height: 16),
                  Text(
                    'Ingredients',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  ...recipe.ingredients.map((ing) => Text(ing)),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(recipe.description),
                  const SizedBox(height: 16),
                  Text(
                    'Deliverable Ingredients',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  ...recipe.deliverableIngredients.map((ing) => Text(ing)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
