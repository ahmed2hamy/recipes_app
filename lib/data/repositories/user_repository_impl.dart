import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/data/data_sources/local/user_local_data_source.dart';
import 'package:recipes_app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:recipes_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, bool>> authenticate(
      String username, String password) async {
    try {
      final user = await remoteDataSource.authenticate(
        username: username,
        password: password,
      );
      if (user != null) {
        await localDataSource.cacheUserDetails(user);
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
