import 'package:flutter/material.dart';
import 'package:my_finances/features/profile/change_name.dart';
import 'package:my_finances/features/profile/change_password.dart';
import 'package:my_finances/features/profile/profile_home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page = const ProfileHome();

        if (settings.name == '/change_name') {
          page = const ChangeNamePage();
        }
        if (settings.name == '/change_password') {
          page = const ChangePasswordPage();
        }

        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
