import 'package:flutter/material.dart';
import 'package:my_finances/features/sign_up/sign_up_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage()
    );
  }
}