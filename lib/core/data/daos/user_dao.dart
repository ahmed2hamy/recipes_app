import 'package:floor/floor.dart';
import 'package:recipes_app/domain/entities/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM UserModel WHERE id = :id')
  Future<User?> findUserById(String id);

  @Query('SELECT * FROM UserModel LIMIT 1')
  Future<User?> findUser();

  @insert
  Future<void> insertUser(User user);

  @update
  Future<void> updateUser(User user);

  @delete
  Future<void> deleteUser(User user);
}
