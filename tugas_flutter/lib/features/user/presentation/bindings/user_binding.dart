import 'package:get/get.dart';
import 'package:tugas_flutter/features/user/data/data_source/remote/user_service.dart';
import 'package:tugas_flutter/features/user/data/mapper/user_entity_mapper.dart';
import 'package:tugas_flutter/features/user/data/repository/user_impl.dart';
import 'package:tugas_flutter/features/user/domain/repository/user_repository.dart';
import 'package:tugas_flutter/features/user/domain/use_case/fetch_list_user.dart';
import 'package:tugas_flutter/features/user/presentation/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserService());
    Get.lazyPut(() => UserEntityMapper());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(
          userService: Get.find(),
          userEntityMapper: Get.find(),
        ));
    Get.lazyPut(() => FetchListUser(Get.find()));
    Get.lazyPut(() => UserController(fetchListUser: Get.find()));
  }
}
