import 'dart:math' as math;

import 'package:recipes_app/core/network/network_client.dart';
import 'package:recipes_app/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<User?> authenticate({
    required String username,
    required String password,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final NetworkClient networkClient;

  UserRemoteDataSourceImpl(this.networkClient);

  @override
  Future<User?> authenticate({
    required String username,
    required String password,
  }) async {
    ///Fake authenticate for testing
    return User(
        id: math.Random().nextInt(99999999).toString(),
        name: username,
        email: '$username@email.com');

    // try {
    //   final response = await networkClient.post('/authenticate', data: {
    //     'username': username,
    //     'password': password,
    //   });
    //   if (response.statusCode == 200) {
    //     return UserModel.fromJson(response.data);
    //   }
    // } catch (e) {
    //   throw ServerException('Failed to authenticate: ${e.toString()}');
    // }
    // return null;
  }
}
