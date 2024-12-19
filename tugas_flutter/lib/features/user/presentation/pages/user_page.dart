import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter/core/enum/response_state.dart';
import 'package:tugas_flutter/features/user/presentation/controllers/user_controller.dart';
import 'package:tugas_flutter/features/user/presentation/pages/detail_user_page.dart';
import 'package:tugas_flutter/features/user/presentation/widgets/card_user.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Obx(() {
            if (userController.responseState.value == ResponseState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (userController.responseState.value ==
                ResponseState.success) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: userController.list.length,
                itemBuilder: (context, index) {
                  final user = userController.list[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailUserPage(id: user.id)));
                      },
                      child: CardUser(
                        image: user.avatar,
                        email: user.email,
                        name: user.firstName + user.lastName,
                      ));
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 32),
              );
            } else {
              return Center(
                child: Text(userController.message.value),
              );
            }
          }),
        ),
      ),
    );
  }
}
