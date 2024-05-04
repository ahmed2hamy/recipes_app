import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/core/use_case/use_case.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/repositories/favorites_repository.dart';

class UpdateFavoriteStatus extends UseCase<void, FavoriteParams> {
  final FavoritesRepository repository;

  UpdateFavoriteStatus(this.repository);

  @override
  Future<Either<Failure, void>> call(FavoriteParams params) async {
    return params.isFavorite
        ? repository.addFavorite(params.recipe)
        : repository.removeFavorite(params.recipe.id);
  }
}

class FavoriteParams extends Equatable {
  final Recipe recipe;
  final bool isFavorite;

  const FavoriteParams({
    required this.recipe,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [recipe, isFavorite];
}
