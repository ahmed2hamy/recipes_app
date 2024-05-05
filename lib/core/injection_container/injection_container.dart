import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes_app/core/data/app_database.dart';
import 'package:recipes_app/core/network/network_client.dart';
import 'package:recipes_app/core/network/network_info.dart';
import 'package:recipes_app/data/data_sources/local/recipe_local_data_source.dart';
import 'package:recipes_app/data/data_sources/local/user_local_data_source.dart';
import 'package:recipes_app/data/data_sources/remote/recipe_remote_data_source.dart';
import 'package:recipes_app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:recipes_app/data/repositories/favorites_repository_impl.dart';
import 'package:recipes_app/data/repositories/recipe_repository_impl.dart';
import 'package:recipes_app/data/repositories/user_repository_impl.dart';
import 'package:recipes_app/domain/repositories/favorites_repository.dart';
import 'package:recipes_app/domain/repositories/recipe_repository.dart';
import 'package:recipes_app/domain/repositories/user_repository.dart';
import 'package:recipes_app/domain/use_cases/fetch_recipes_use_case.dart';
import 'package:recipes_app/domain/use_cases/get_favorites_use_case.dart';
import 'package:recipes_app/domain/use_cases/update_favorite_status_use_case.dart';
import 'package:recipes_app/domain/use_cases/user_login_use_case.dart';
import 'package:recipes_app/presentation/manager/authentication_cubit.dart';
import 'package:recipes_app/presentation/manager/favorites_cubit.dart';
import 'package:recipes_app/presentation/manager/recipes_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppDatabase appDatabase = await getAppDatabase();

  sl.registerSingleton<AppDatabase>(appDatabase);

  // Features - Bloc
  sl.registerFactory(
    () => AuthenticationCubit(sl<UserLogin>()),
  );
  sl.registerFactory(
    () => FavoritesCubit(
      sl<GetFavorites>(),
      sl<UpdateFavoriteStatus>(),
    ),
  );
  sl.registerFactory(
    () => RecipesCubit(sl<FetchRecipes>()),
  );

  // Use cases
  sl.registerLazySingleton(() => UserLogin(sl<UserRepository>()));
  sl.registerLazySingleton(() => GetFavorites(sl<FavoritesRepository>()));
  sl.registerLazySingleton(
      () => UpdateFavoriteStatus(sl<FavoritesRepository>()));
  sl.registerLazySingleton(() => FetchRecipes(sl<RecipeRepository>()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl<UserRemoteDataSource>(),
      localDataSource: sl<UserLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(
      sl<RecipeLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      remoteDataSource: sl<RecipeRemoteDataSource>(),
      localDataSource: sl<RecipeLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Remote Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      sl<NetworkClient>(),
    ),
  );
  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(
      networkClient: sl<NetworkClient>(),
    ),
  );

  // Local Data sources
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(
      sl<AppDatabase>(),
    ),
  );
  sl.registerLazySingleton<RecipeLocalDataSource>(
    () => RecipeLocalDataSourceImpl(
      sl<AppDatabase>(),
    ),
  );

  // Core
  sl.registerLazySingleton<NetworkClient>(
    () => NetworkClient(sl<Dio>()),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl<Connectivity>()),
  );

  // External
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}
