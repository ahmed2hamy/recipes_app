import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class User extends Equatable {
  @primaryKey
  final String id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
      ];
}
