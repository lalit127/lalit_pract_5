import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_pract_5/view/home_screen.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeScreen()
    );
  }
}