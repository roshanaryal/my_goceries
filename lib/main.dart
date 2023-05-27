import 'package:flutter/material.dart';
import 'package:shopping_list/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutterr grocories',
    theme: ThemeData.dark().copyWith(
      
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 147, 229, 250),
        brightness: Brightness.dark,
        surface: const Color.fromARGB(255, 50, 58, 60),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
    ),
    home: HomeScreen(),
  ));
}
