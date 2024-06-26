import 'package:first_assignment/screen/home_screen.dart';
import 'package:first_assignment/screen/login_screen.dart';
import 'package:first_assignment/techer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
   return runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final teacherListController = Get.put(TeacherListController()); // Initialize controller

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}