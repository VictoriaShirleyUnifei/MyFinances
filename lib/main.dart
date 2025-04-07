import 'package:flutter/material.dart';
import 'package:my_finances/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(), // <- Aqui está chamando sua navegação!
    );
  }
}
