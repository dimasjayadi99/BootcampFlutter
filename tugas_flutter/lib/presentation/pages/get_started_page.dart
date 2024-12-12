import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/core/constant/string.dart';
import 'package:tugas_flutter/presentation/widgets/custom_button.dart';
import 'package:tugas_flutter/shared/gap.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 86, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logoPath,
                width: 352,
                height: 330,
              ),
              const Gap.v(h: 30),
              Text(
                tagLine1,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const Gap.v(h: 15),
              Text(
                tagLine2,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              CustomButton(
                label: 'Masuk',
                backgroundColor: primaryColor,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
              const Gap.v(h: 15),
              CustomButton(
                label: 'Mendaftar',
                labelColor: primaryColor,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
