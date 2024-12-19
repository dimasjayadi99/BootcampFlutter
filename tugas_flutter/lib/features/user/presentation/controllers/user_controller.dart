import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter/core/enum/response_state.dart';
import 'package:tugas_flutter/features/user/domain/use_case/fetch_list_user.dart';
import '../../domain/entities/user_entity.dart';

class UserController extends GetxController {
  final FetchListUser fetchListUser;
  UserController({required this.fetchListUser});

  var responseState = ResponseState.init.obs;
  var list = <UserEntity>[].obs;
  var message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchListUserData();
  }

  Future<List<UserEntity>> fetchListUserData() async {
    responseState.value = ResponseState.loading;
    update();

    try {
      final response = await fetchListUser.fetchListUser();
      list.assignAll(response);
      responseState.value = ResponseState.success;
      return response;
    } catch (e) {
      responseState.value = ResponseState.failed;
      message.value = 'Terjadi kesalahan saat mengambil data';
      debugPrint(' Error Message : $e');
      return [];
    } finally {
      update();
    }
  }
}
