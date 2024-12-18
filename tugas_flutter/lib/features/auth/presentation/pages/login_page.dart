import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:tugas_flutter/features/news/presentation/widgets/custom_button.dart';
import 'package:tugas_flutter/shared/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isObscure = true;
  bool loading = false;

  Future<void> loginUser(String email, String password) async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setState(() {
        loading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login berhasil!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      if (mounted) Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login gagal: ${e.message}'),
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
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    suffixIcon:
                        isObscure ? Icons.visibility_off : Icons.visibility,
                    isObscure: isObscure,
                    suffixTap: () {
                      setState(() {
                        isObscure = !isObscure;
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
                  const Row(
                    children: [
                      Spacer(),
                      Text('Lupa Password?'),
                    ],
                  ),
                  const Gap.v(h: 32),
                  loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          label: 'Masuk',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();
                              await loginUser(email, password);
                            }
                          },
                          backgroundColor: primaryColor,
                        ),
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
