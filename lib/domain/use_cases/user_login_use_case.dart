import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_app/core/models/failures.dart';
import 'package:recipes_app/core/use_case/use_case.dart';
import 'package:recipes_app/domain/entities/user.dart';
import 'package:recipes_app/domain/repositories/user_repository.dart';

class UserLogin extends UseCase<User, LoginParams> {
  final UserRepository repository;

  UserLogin(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.authenticate(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
