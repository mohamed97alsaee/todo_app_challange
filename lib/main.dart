import 'package:flutter/material.dart';
import 'package:todo_app_challange/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(centerTitle: true)),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
