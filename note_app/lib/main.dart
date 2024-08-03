import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Screen/splash_screen.dart';
import 'package:note_app/Theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note App',
      theme: lighttheme,
       darkTheme: darktheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
