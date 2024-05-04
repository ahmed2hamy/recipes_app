import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/core/use_case/use_case.dart';
import 'package:recipes_app/domain/entities/recipe.dart';
import 'package:recipes_app/domain/repositories/favorites_repository.dart';

class GetFavorites extends UseCase<List<Recipe>, NoParams> {
  final FavoritesRepository repository;

  GetFavorites(this.repository);

  @override
  Future<Either<Failure, List<Recipe>>> call(NoParams params) async {
    return await repository.getFavorites();
  }
}
