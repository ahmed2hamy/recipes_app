import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/injection_container/injection_container.dart'
    as di;
import 'package:recipes_app/presentation/manager/authentication_cubit.dart';
import 'package:recipes_app/presentation/manager/favorites_cubit.dart';
import 'package:recipes_app/presentation/manager/recipes_cubit.dart';
import 'package:recipes_app/presentation/pages/login_screen.dart';

void main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthenticationCubit>()),
        BlocProvider(create: (_) => di.sl<FavoritesCubit>()),
        BlocProvider(create: (_) => di.sl<RecipesCubit>()),
      ],
      child: MaterialApp(
        title: 'Recipes App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
