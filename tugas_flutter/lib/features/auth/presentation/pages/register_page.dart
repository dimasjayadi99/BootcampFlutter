import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:tugas_flutter/features/news/presentation/widgets/custom_button.dart';
import 'package:tugas_flutter/shared/gap.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isObscure1 = true;
  bool isObscure2 = true;
  bool loading = false;

  Future<void> createUser(String email, String password) async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setState(() {
        loading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registrasi berhasil!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registrasi gagal: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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
                  CustomTextField(
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility_off,
                    controller: _passwordController,
                    isObscure: isObscure1,
                    suffixTap: () {
                      setState(() {
                        isObscure1 = !isObscure1;
                      });
                    },
                    validator: (value) {
                      if (value == '') {
                        return 'Password masih kosong!';
                      }
                      return null;
                    },
                  ),
                  const Gap.v(h: 16),
                  CustomTextField(
                    label: 'Konfirmasi Password',
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility_off,
                    controller: _confirmPasswordController,
                    isObscure: isObscure2,
                    suffixTap: () {
                      setState(() {
                        isObscure2 = !isObscure2;
                      });
                    },
                    validator: (value) {
                      if (value == '') {
                        return 'Konfirmasi password masih kosong!';
                      } else if (value != _passwordController.text.trim()) {
                        return 'Password tidak sama';
                      }
                      return null;
                    },
                  ),
                  const Gap.v(h: 32),
                  loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          label: 'Mendaftar',
                          backgroundColor: primaryColor,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();

                              await createUser(email, password);
                            }
                          },
                        ),
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
                              Navigator.of(context).pop();
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
