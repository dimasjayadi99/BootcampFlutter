import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/core/enum/response_state.dart';
import 'package:tugas_flutter/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:tugas_flutter/features/news/presentation/widgets/custom_button.dart';
import 'package:tugas_flutter/shared/gap.dart';
import '../../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    registerIllustrationPath,
                    width: 300,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  CustomTextField(
                    label: 'Email Address',
                    prefixIcon: Icons.email,
                    controller: _emailController,
                    validator: (value) {
                      if (value == '') {
                        return 'Email masih kosong!';
                      }
                      return null;
                    },
                  ),
                  const Gap.v(h: 16),
                  Obx(() => CustomTextField(
                        label: 'Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility_off,
                        controller: _passwordController,
                        isObscure: controller.isObscure1.value,
                        suffixTap: () =>
                            controller.suffixIconTap(controller.isObscure1),
                        validator: (value) {
                          if (value == '') {
                            return 'Password masih kosong!';
                          }
                          return null;
                        },
                      )),
                  const Gap.v(h: 16),
                  Obx(() => CustomTextField(
                        label: 'Konfirmasi Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility_off,
                        controller: _confirmPasswordController,
                        isObscure: controller.isObscure2.value,
                        suffixTap: () =>
                            controller.suffixIconTap(controller.isObscure2),
                        validator: (value) {
                          if (value == '') {
                            return 'Konfirmasi password masih kosong!';
                          } else if (value != _passwordController.text.trim()) {
                            return 'Password tidak sama';
                          }
                          return null;
                        },
                      )),
                  const Gap.v(h: 32),
                  Obx(() =>
                      controller.responseState.value == ResponseState.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              label: 'Mendaftar',
                              backgroundColor: primaryColor,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  final email = _emailController.text.trim();
                                  final password =
                                      _passwordController.text.trim();

                                  await controller.createUser(email, password);

                                  if (controller.responseState.value ==
                                      ResponseState.success) {
                                    Get.back();

                                    Get.snackbar(
                                        'Berhasil Registrasi', 'Silahkan login',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white);
                                  } else {
                                    Get.snackbar('Gagal Registrasi',
                                        'Periksa kembali isian anda',
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white);
                                  }
                                }
                              },
                            )),
                  const Gap.v(h: 16),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.grey,
                      )),
                      Gap.h(w: 8),
                      Text(
                        'Atau masuk menggunakan',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Gap.h(w: 8),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.grey,
                      )),
                    ],
                  ),
                  const Gap.v(h: 16),
                  CustomButton(
                    label: 'Google',
                    onTap: () {},
                    labelColor: 0XFFE74C3C,
                    borderColor: 0XFFE74C3C,
                    icon: googleIconPath,
                  ),
                  const Gap.v(h: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Sudah punya akun? '),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Text(
                              'Masuk',
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
