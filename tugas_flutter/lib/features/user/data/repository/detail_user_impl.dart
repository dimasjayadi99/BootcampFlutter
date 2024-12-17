import '../../domain/entities/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/remote/user_service.dart';
import '../mapper/user_entity_mapper.dart';

class DetailUserImpl implements UserDetailRepository {
  final UserService userService;
  final UserEntityMapper userEntityMapper;

  DetailUserImpl({required this.userService, required this.userEntityMapper});

  @override
  Future<UserEntity> fetchDetailUser(int id) async {
    try {
      final response = await userService.fetchDetailUser(id);
      final mappingData = userEntityMapper.toUser(response);
      return mappingData;
    } catch (e) {
      rethrow;
    }
  }
}
