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
    return repository.toggleFavorite(params.recipe);
  }
}

class FavoriteParams extends Equatable {
  final Recipe recipe;

  const FavoriteParams({required this.recipe});

  @override
  List<Object> get props => [recipe];
}
