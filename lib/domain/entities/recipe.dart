import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'recipes')
class Recipe extends Equatable {
  @primaryKey
  final String id;
  final bool isFavorite;
  final String fats;
  final String name;
  final String time;
  final String image;
  final List<String> weeks;
  final String carbos;
  final String fibers;
  final String country;
  final String calories;
  final String headline;
  final List<String> keywords;
  final List<String> products;
  final String proteins;
  final int favorites;
  final int difficulty;
  final String description;
  final bool highlighted;
  final List<String> ingredients;
  final List<String> deliverableIngredients;

  const Recipe({
    required this.id,
    this.isFavorite = false,
    required this.fats,
    required this.name,
    required this.time,
    required this.image,
    required this.weeks,
    required this.carbos,
    required this.fibers,
    required this.country,
    required this.calories,
    required this.headline,
    required this.keywords,
    required this.products,
    required this.proteins,
    required this.favorites,
    required this.difficulty,
    required this.description,
    required this.highlighted,
    required this.ingredients,
    required this.deliverableIngredients,
  });

  @override
  List<Object?> get props => [
        id,
        isFavorite,
        fats,
        name,
        time,
        image,
        weeks,
        carbos,
        fibers,
        country,
        calories,
        headline,
        keywords,
        products,
        proteins,
        favorites,
        difficulty,
        description,
        highlighted,
        ingredients,
        deliverableIngredients,
      ];

  Recipe copyWith({
    String? id,
    bool? isFavorite,
    String? fats,
    String? name,
    String? time,
    String? image,
    List<String>? weeks,
    String? carbos,
    String? fibers,
    String? country,
    String? calories,
    String? headline,
    List<String>? keywords,
    List<String>? products,
    String? proteins,
    int? favorites,
    int? difficulty,
    String? description,
    bool? highlighted,
    List<String>? ingredients,
    List<String>? deliverableIngredients,
  }) {
    return Recipe(
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
      fats: fats ?? this.fats,
      name: name ?? this.name,
      time: time ?? this.time,
      image: image ?? this.image,
      weeks: weeks ?? this.weeks,
      carbos: carbos ?? this.carbos,
      fibers: fibers ?? this.fibers,
      country: country ?? this.country,
      calories: calories ?? this.calories,
      headline: headline ?? this.headline,
      keywords: keywords ?? this.keywords,
      products: products ?? this.products,
      proteins: proteins ?? this.proteins,
      favorites: favorites ?? this.favorites,
      difficulty: difficulty ?? this.difficulty,
      description: description ?? this.description,
      highlighted: highlighted ?? this.highlighted,
      ingredients: ingredients ?? this.ingredients,
      deliverableIngredients:
          deliverableIngredients ?? this.deliverableIngredients,
    );
  }
}
