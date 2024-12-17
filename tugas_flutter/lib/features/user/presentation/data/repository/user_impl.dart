import 'package:tugas_flutter/features/user/presentation/data/data_source/remote/user_service.dart';
import 'package:tugas_flutter/features/user/presentation/data/mapper/user_entity_mapper.dart';
import 'package:tugas_flutter/features/user/presentation/domain/entities/user_entity.dart';
import 'package:tugas_flutter/features/user/presentation/domain/repository/user_repository.dart';

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
