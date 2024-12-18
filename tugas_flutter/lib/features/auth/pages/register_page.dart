import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/features/auth/widgets/custom_text_field.dart';
import 'package:tugas_flutter/features/news/presentation/widgets/custom_button.dart';
import 'package:tugas_flutter/shared/gap.dart';

class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(registerIllustrationPath, width: 300, height: 300, fit: BoxFit.cover,),

                const CustomTextField(label: 'Email Address', preffixIcon: Icons.email,),

                const Gap.v(h: 16),

                const CustomTextField(label: 'Password', preffixIcon: Icons.lock, suffixIcon: Icons.visibility_off,),

                const Gap.v(h: 16),

                const CustomTextField(label: 'Konfirmasi Password', preffixIcon: Icons.lock, suffixIcon: Icons.visibility_off,),

                const Gap.v(h: 32),

                CustomButton(label: 'Mendaftar', onTap: (){}, backgroundColor: primaryColor,),

                const Gap.v(h: 16),

                const Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, height: 1, color: Colors.grey,)),
                    Gap.h(w: 8),
                    Text('Atau masuk menggunakan', style: TextStyle(color: Colors.grey),),
                    Gap.h(w: 8),
                    Expanded(child: Divider(thickness: 1, height: 1, color: Colors.grey,)),
                  ],
                ),

                const Gap.v(h: 16),

                CustomButton(label: 'Google', onTap: (){}, labelColor: 0XFFE74C3C, borderColor: 0XFFE74C3C, icon: googleIconPath,),

                const Spacer(),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Sudah punya akun? '),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: const Text('Masuk', style: TextStyle(color: Colors.blue),)),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}