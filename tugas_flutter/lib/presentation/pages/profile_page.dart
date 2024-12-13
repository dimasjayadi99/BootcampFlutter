import 'package:flutter/material.dart';
import 'package:tugas_flutter/core/constant/color.dart';
import 'package:tugas_flutter/shared/gap.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Profile Page'),
          const Gap.v(h: 16),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(const Color(primaryColor)),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            child: const Text(
              'Logout Account',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
