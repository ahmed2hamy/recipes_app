import 'package:recipes_app/core/data/app_database.dart';
import 'package:recipes_app/data/models/user_model.dart';
import 'package:recipes_app/domain/entities/user.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUserDetails(User user);

  Future<User?> getUserDetails();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final AppDatabase database;

  UserLocalDataSourceImpl(this.database);

  @override
  Future<void> cacheUserDetails(User user) async {
    final userDao = database.userDao;
    await userDao.insertUser(UserModel.fromEntity(user));
  }

  @override
  Future<User?> getUserDetails() async {
    final userDao = database.userDao;
    User? userModel = await userDao.findUser();
    return userModel;
  }
}
