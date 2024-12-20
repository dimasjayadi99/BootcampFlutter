import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/core/enum/response_state.dart';
import 'package:tugas_flutter/features/auth/controllers/login_controller.dart';
import 'package:tugas_flutter/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:tugas_flutter/features/news/presentation/widgets/custom_button.dart';
import 'package:tugas_flutter/shared/gap.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<LoginController>();

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
                    loginIllustrationPath,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  const Gap.v(h: 32),
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
                        controller: _passwordController,
                        label: 'Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: controller.isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        isObscure: controller.isObscure.value,
                        suffixTap: controller.suffixIconTap,
                        validator: (value) {
                          if (value == '') {
                            return 'Password masih kosong!';
                          }
                          return null;
                        },
                      )),
                  const Gap.v(h: 16),
                  const Row(
                    children: [
                      Spacer(),
                      Text('Lupa Password?'),
                    ],
                  ),
                  const Gap.v(h: 32),
                  Obx(() => controller.responseState.value ==
                          ResponseState.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          label: 'Masuk',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();
                              await controller.loginUser(email, password);

                              if (controller.responseState.value ==
                                  ResponseState.success) {
                                Get.snackbar('Berhasil login', 'Selamat datang',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                                Get.toNamed('/home');
                              } else {
                                Get.snackbar('Gagal login',
                                    'Periksa kembali email dan password anda',
                                    backgroundColor: Colors.redAccent,
                                    colorText: Colors.white);
                              }
                            }
                          },
                          backgroundColor: primaryColor,
                        )),
                  const Gap.v(h: 16),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
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
                        ),
                      ),
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
                  const Spacer(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Belum punya akun? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: const Text(
                            'Daftar Sekarang',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
