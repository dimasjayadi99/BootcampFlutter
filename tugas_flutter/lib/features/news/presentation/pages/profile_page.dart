import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter/shared/gap.dart';
import '../widgets/menu_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final List<Widget> listMenuSettings = [
    MenuProfile(
      title: 'Profile Settings',
      label: 'Settings regarding your profile',
      icon: Icons.person_outline_rounded,
      onTap: (BuildContext context) {},
    ),
    MenuProfile(
      title: 'News settings',
      label: 'Choose your favourite topics',
      icon: Icons.newspaper_outlined,
      onTap: (BuildContext context) {},
    ),
    MenuProfile(
      title: 'Notifications',
      label: 'When would you like to be notified',
      icon: Icons.notifications_outlined,
      onTap: (BuildContext context) {},
    ),
    MenuProfile(
      title: 'Subscriptions',
      label: 'Currently, you are in Starter Plan',
      icon: Icons.folder_copy_outlined,
      onTap: (BuildContext context) {},
    ),
  ];

  final List<Widget> listMenuOther = [
    MenuProfile(
      title: 'Bug Report',
      label: 'Report bugs very easy',
      icon: Icons.bug_report_outlined,
      onTap: (BuildContext context) {},
    ),
    MenuProfile(
      title: 'Share the app',
      label: 'Share on social media networks',
      icon: Icons.share_outlined,
      onTap: (BuildContext context) {},
    ),
    MenuProfile(
      title: 'Logout',
      label: 'Click for logout from your account',
      icon: Icons.logout_outlined,
      onTap: (BuildContext context) {
        Get.offAllNamed('/started');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Settings',
                  style: Theme.of(context).textTheme.headlineLarge),
              const Gap.v(h: 24),
              _buildMenuList(listMenuSettings),
              const Gap.v(h: 32),
              Text('Other', style: Theme.of(context).textTheme.headlineMedium),
              const Gap.v(h: 24),
              _buildMenuList(listMenuOther),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuList(List<Widget> menuList) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        return menuList[index];
      },
      separatorBuilder: (context, index) => const Gap.v(h: 24),
    );
  }
}
