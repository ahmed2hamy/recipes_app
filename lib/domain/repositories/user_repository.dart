import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/models/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> authenticate(String email, String password);
}
