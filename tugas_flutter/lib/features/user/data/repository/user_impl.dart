import '../../domain/entities/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/remote/user_service.dart';
import '../mapper/user_entity_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService userService;
  final UserEntityMapper userEntityMapper;

  UserRepositoryImpl(
      {required this.userService, required this.userEntityMapper});

  @override
  Future<List<UserEntity>> fetchListUser() async {
    try {
      final response = await userService.fetchListUser();
      final mappingData = userEntityMapper.toUserList(response.data);
      return mappingData;
    } catch (e) {
      rethrow;
    }
  }
}
