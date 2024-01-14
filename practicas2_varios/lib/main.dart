import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:practicas2_varios/screens/my_home_page_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: MaterialApp(
        title: 'Practica 2',
        // Set Raleway as the default app font.
        // theme: ThemeData(fontFamily: 'Raleway'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}