import 'package:tugas_flutter/features/user/presentation/domain/entities/user_entity.dart';

import '../repository/user_repository.dart';

class FetchDetailUser {
  final UserDetailRepository userRepository;
  FetchDetailUser(this.userRepository);

  Future<UserEntity> fetchDetailUser(int id) async {
    return await userRepository.fetchDetailUser(id);
  }
}
