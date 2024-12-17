import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class FetchListUser {
  final UserRepository userRepository;
  FetchListUser(this.userRepository);

  Future<List<UserEntity>> fetchListUser() async {
    return await userRepository.fetchListUser();
  }
}
