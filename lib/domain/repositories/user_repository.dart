import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> authenticate(String email, String password);
}
