import 'package:tugas_flutter/features/user/presentation/data/models/user_model.dart';
import 'package:tugas_flutter/features/user/presentation/domain/entities/user_entity.dart';

class UserEntityMapper {
  UserEntity toUser(Datum user) {
    try {
      return UserEntity(
          id: user.id,
          email: user.email,
          firstName: user.firstName,
          lastName: user.lastName,
          avatar: user.avatar);
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }
  }

  List<UserEntity> toUserList(List<Datum> dataList) {
    final List<UserEntity> list = [];

    for (var data in dataList) {
      try {
        list.add(toUser(data));
      } catch (e) {
        throw Exception('Could not map entity : $e');
      }
    }

    return list;
  }
}