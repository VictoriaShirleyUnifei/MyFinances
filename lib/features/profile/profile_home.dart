import 'package:flutter/material.dart';
import 'package:my_finances/common/constants/app_colors.dart';
import 'package:my_finances/common/widgets/custom_background.dart';
import 'package:my_finances/common/widgets/notification_button.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                const CustomBackground(),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(width: 30),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      NotificationIconButton(),
                    ],
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      backgroundColor: AppColors.card,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Enjelin Morgeana',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'enjelinmorgeana@email.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  leading: const Icon(Icons.person_outline, size: 30),
                  title: const Text(
                    'Change name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/change_name');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.password_outlined, size: 30),
                  title: const Text(
                    'Change password',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                   onTap: () {
                    Navigator.of(context).pushNamed('/change_password');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, size: 30),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
