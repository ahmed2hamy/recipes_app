import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/data/data_sources/local/user_local_data_source.dart';
import 'package:recipes_app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:recipes_app/domain/entities/user.dart';
import 'package:recipes_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> authenticate(
      String email, String password) async {
    try {
      final user = await remoteDataSource.authenticate(
        email: email,
        password: password,
      );
      if (user != null) {
        await localDataSource.cacheUserDetails(user);
        return Right(user);
      } else {
        return const Left(ServerFailure(message: 'User not found'));
      }
    } catch (e) {
      log('UserRepository::$e');
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
