import 'package:flutter/material.dart';
import 'package:my_finances/features/forgot_password/forgot_password_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotPasswordPage()
    );
  }
}