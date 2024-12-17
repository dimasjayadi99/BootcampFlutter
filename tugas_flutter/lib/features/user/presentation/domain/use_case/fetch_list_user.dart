import 'package:tugas_flutter/features/user/presentation/domain/entities/user_entity.dart';
import 'package:tugas_flutter/features/user/presentation/domain/repository/user_repository.dart';

class FetchListUser {
  final UserRepository userRepository;
  FetchListUser(this.userRepository);

  Future<List<UserEntity>> fetchListUser() async {
    return await userRepository.fetchListUser();
  }
}
