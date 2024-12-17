import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> fetchListUser();
}

abstract class UserDetailRepository {
  Future<UserEntity> fetchDetailUser(int id);
}
