// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RecipeDao? _recipeDaoInstance;

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `recipes` (`id` TEXT NOT NULL, `isFavorite` INTEGER NOT NULL, `fats` TEXT NOT NULL, `name` TEXT NOT NULL, `time` TEXT NOT NULL, `image` TEXT NOT NULL, `weeks` TEXT NOT NULL, `carbos` TEXT NOT NULL, `fibers` TEXT NOT NULL, `country` TEXT NOT NULL, `calories` TEXT NOT NULL, `headline` TEXT NOT NULL, `keywords` TEXT NOT NULL, `products` TEXT NOT NULL, `proteins` TEXT NOT NULL, `favorites` INTEGER NOT NULL, `difficulty` INTEGER NOT NULL, `description` TEXT NOT NULL, `highlighted` INTEGER NOT NULL, `ingredients` TEXT NOT NULL, `deliverableIngredients` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `email` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RecipeDao get recipeDao {
    return _recipeDaoInstance ??= _$RecipeDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$RecipeDao extends RecipeDao {
  _$RecipeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _recipeInsertionAdapter = InsertionAdapter(
            database,
            'recipes',
            (Recipe item) => <String, Object?>{
                  'id': item.id,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'fats': item.fats,
                  'name': item.name,
                  'time': item.time,
                  'image': item.image,
                  'weeks': _stringListConverter.encode(item.weeks),
                  'carbos': item.carbos,
                  'fibers': item.fibers,
                  'country': item.country,
                  'calories': item.calories,
                  'headline': item.headline,
                  'keywords': _stringListConverter.encode(item.keywords),
                  'products': _stringListConverter.encode(item.products),
                  'proteins': item.proteins,
                  'favorites': item.favorites,
                  'difficulty': item.difficulty,
                  'description': item.description,
                  'highlighted': item.highlighted ? 1 : 0,
                  'ingredients': _stringListConverter.encode(item.ingredients),
                  'deliverableIngredients':
                      _stringListConverter.encode(item.deliverableIngredients)
                }),
        _recipeUpdateAdapter = UpdateAdapter(
            database,
            'recipes',
            ['id'],
            (Recipe item) => <String, Object?>{
                  'id': item.id,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'fats': item.fats,
                  'name': item.name,
                  'time': item.time,
                  'image': item.image,
                  'weeks': _stringListConverter.encode(item.weeks),
                  'carbos': item.carbos,
                  'fibers': item.fibers,
                  'country': item.country,
                  'calories': item.calories,
                  'headline': item.headline,
                  'keywords': _stringListConverter.encode(item.keywords),
                  'products': _stringListConverter.encode(item.products),
                  'proteins': item.proteins,
                  'favorites': item.favorites,
                  'difficulty': item.difficulty,
                  'description': item.description,
                  'highlighted': item.highlighted ? 1 : 0,
                  'ingredients': _stringListConverter.encode(item.ingredients),
                  'deliverableIngredients':
                      _stringListConverter.encode(item.deliverableIngredients)
                }),
        _recipeDeletionAdapter = DeletionAdapter(
            database,
            'recipes',
            ['id'],
            (Recipe item) => <String, Object?>{
                  'id': item.id,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'fats': item.fats,
                  'name': item.name,
                  'time': item.time,
                  'image': item.image,
                  'weeks': _stringListConverter.encode(item.weeks),
                  'carbos': item.carbos,
                  'fibers': item.fibers,
                  'country': item.country,
                  'calories': item.calories,
                  'headline': item.headline,
                  'keywords': _stringListConverter.encode(item.keywords),
                  'products': _stringListConverter.encode(item.products),
                  'proteins': item.proteins,
                  'favorites': item.favorites,
                  'difficulty': item.difficulty,
                  'description': item.description,
                  'highlighted': item.highlighted ? 1 : 0,
                  'ingredients': _stringListConverter.encode(item.ingredients),
                  'deliverableIngredients':
                      _stringListConverter.encode(item.deliverableIngredients)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Recipe> _recipeInsertionAdapter;

  final UpdateAdapter<Recipe> _recipeUpdateAdapter;

  final DeletionAdapter<Recipe> _recipeDeletionAdapter;

  @override
  Future<List<Recipe>> getAllRecipes() async {
    return _queryAdapter.queryList('SELECT * FROM recipes',
        mapper: (Map<String, Object?> row) => Recipe(
            id: row['id'] as String,
            isFavorite: (row['isFavorite'] as int) != 0,
            fats: row['fats'] as String,
            name: row['name'] as String,
            time: row['time'] as String,
            image: row['image'] as String,
            weeks: _stringListConverter.decode(row['weeks'] as String),
            carbos: row['carbos'] as String,
            fibers: row['fibers'] as String,
            country: row['country'] as String,
            calories: row['calories'] as String,
            headline: row['headline'] as String,
            keywords: _stringListConverter.decode(row['keywords'] as String),
            products: _stringListConverter.decode(row['products'] as String),
            proteins: row['proteins'] as String,
            favorites: row['favorites'] as int,
            difficulty: row['difficulty'] as int,
            description: row['description'] as String,
            highlighted: (row['highlighted'] as int) != 0,
            ingredients:
                _stringListConverter.decode(row['ingredients'] as String),
            deliverableIngredients: _stringListConverter
                .decode(row['deliverableIngredients'] as String)));
  }

  @override
  Future<Recipe?> getRecipeById(String id) async {
    return _queryAdapter.query('SELECT * FROM recipes WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Recipe(
            id: row['id'] as String,
            isFavorite: (row['isFavorite'] as int) != 0,
            fats: row['fats'] as String,
            name: row['name'] as String,
            time: row['time'] as String,
            image: row['image'] as String,
            weeks: _stringListConverter.decode(row['weeks'] as String),
            carbos: row['carbos'] as String,
            fibers: row['fibers'] as String,
            country: row['country'] as String,
            calories: row['calories'] as String,
            headline: row['headline'] as String,
            keywords: _stringListConverter.decode(row['keywords'] as String),
            products: _stringListConverter.decode(row['products'] as String),
            proteins: row['proteins'] as String,
            favorites: row['favorites'] as int,
            difficulty: row['difficulty'] as int,
            description: row['description'] as String,
            highlighted: (row['highlighted'] as int) != 0,
            ingredients:
                _stringListConverter.decode(row['ingredients'] as String),
            deliverableIngredients: _stringListConverter
                .decode(row['deliverableIngredients'] as String)),
        arguments: [id]);
  }

  @override
  Future<List<Recipe>> getFavoriteRecipes() async {
    return _queryAdapter.queryList('SELECT * FROM recipes WHERE isFavorite = 1',
        mapper: (Map<String, Object?> row) => Recipe(
            id: row['id'] as String,
            isFavorite: (row['isFavorite'] as int) != 0,
            fats: row['fats'] as String,
            name: row['name'] as String,
            time: row['time'] as String,
            image: row['image'] as String,
            weeks: _stringListConverter.decode(row['weeks'] as String),
            carbos: row['carbos'] as String,
            fibers: row['fibers'] as String,
            country: row['country'] as String,
            calories: row['calories'] as String,
            headline: row['headline'] as String,
            keywords: _stringListConverter.decode(row['keywords'] as String),
            products: _stringListConverter.decode(row['products'] as String),
            proteins: row['proteins'] as String,
            favorites: row['favorites'] as int,
            difficulty: row['difficulty'] as int,
            description: row['description'] as String,
            highlighted: (row['highlighted'] as int) != 0,
            ingredients:
                _stringListConverter.decode(row['ingredients'] as String),
            deliverableIngredients: _stringListConverter
                .decode(row['deliverableIngredients'] as String)));
  }

  @override
  Future<void> insertRecipe(Recipe recipe) async {
    await _recipeInsertionAdapter.insert(recipe, OnConflictStrategy.ignore);
  }

  @override
  Future<void> updateRecipe(Recipe recipe) async {
    await _recipeUpdateAdapter.update(recipe, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteRecipe(Recipe recipe) async {
    await _recipeDeletionAdapter.delete(recipe);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'users',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'users',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<User?> findUserById(String id) async {
    return _queryAdapter.query('SELECT * FROM UserModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as String,
            name: row['name'] as String,
            email: row['email'] as String),
        arguments: [id]);
  }

  @override
  Future<User?> findUser() async {
    return _queryAdapter.query('SELECT * FROM UserModel LIMIT 1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as String,
            name: row['name'] as String,
            email: row['email'] as String));
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}

// ignore_for_file: unused_element
final _stringListConverter = StringListConverter();
