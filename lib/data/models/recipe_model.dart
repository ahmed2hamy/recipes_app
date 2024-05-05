import 'package:recipes_app/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  const RecipeModel({
    required super.id,
    required super.isFavorite,
    required super.fats,
    required super.name,
    required super.time,
    required super.image,
    required super.weeks,
    required super.carbos,
    required super.fibers,
    required super.country,
    required super.calories,
    required super.headline,
    required super.keywords,
    required super.products,
    required super.proteins,
    required super.favorites,
    required super.difficulty,
    required super.description,
    required super.highlighted,
    required super.ingredients,
    required super.deliverableIngredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      isFavorite: false,
      fats: json['fats'],
      name: json['name'],
      time: json['time'],
      image: json['image'],
      weeks: List<String>.from(json['weeks']),
      carbos: json['carbos'],
      fibers: json['fibers'],
      country: json['country'],
      calories: json['calories'],
      headline: json['headline'],
      keywords: List<String>.from(json['keywords']),
      products: List<String>.from(json['products']),
      proteins: json['proteins'],
      favorites: json['favorites'],
      difficulty: json['difficulty'],
      description: json['description'],
      highlighted: json['highlighted'],
      ingredients: List<String>.from(json['ingredients']),
      deliverableIngredients: List<String>.from(
        json['deliverable_ingredients'],
      ),
    );
  }

  factory RecipeModel.fromEntity(Recipe recipe) {
    return RecipeModel(
      id: recipe.id,
      isFavorite: recipe.isFavorite,
      fats: recipe.fats,
      name: recipe.name,
      time: recipe.time,
      image: recipe.image,
      weeks: recipe.weeks,
      carbos: recipe.carbos,
      fibers: recipe.fibers,
      country: recipe.country,
      calories: recipe.calories,
      headline: recipe.headline,
      keywords: recipe.keywords,
      products: recipe.products,
      proteins: recipe.proteins,
      favorites: recipe.favorites,
      difficulty: recipe.difficulty,
      description: recipe.description,
      highlighted: recipe.highlighted,
      ingredients: recipe.ingredients,
      deliverableIngredients: recipe.deliverableIngredients,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fats': fats,
      'name': name,
      'time': time,
      'image': image,
      'weeks': weeks,
      'carbos': carbos,
      'fibers': fibers,
      'country': country,
      'calories': calories,
      'headline': headline,
      'keywords': keywords,
      'products': products,
      'proteins': proteins,
      'favorites': favorites,
      'difficulty': difficulty,
      'description': description,
      'highlighted': highlighted,
      'ingredients': ingredients,
      'deliverable_ingredients': deliverableIngredients,
    };
  }
}
