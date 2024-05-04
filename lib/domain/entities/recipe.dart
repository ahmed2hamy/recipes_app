import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'recipes')
class Recipe extends Equatable {
  @primaryKey
  final String id;
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
}
