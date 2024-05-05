import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/domain/use_cases/user_login_use_case.dart';

enum AuthenticationState { authenticated, unauthenticated, loading, error }

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserLogin userLogin;

  AuthenticationCubit(this.userLogin)
      : super(AuthenticationState.unauthenticated);

  Future<void> login(String email, String password) async {
    emit(AuthenticationState.loading);
    final result =
        await userLogin(LoginParams(email: email, password: password));
    result.fold(
      (failure) => emit(AuthenticationState.error),
      (_) => emit(AuthenticationState.authenticated),
    );
  }

  void logout() {
    emit(AuthenticationState.unauthenticated);
  }
}
