import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satat_task/views/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "task",
      home: HomePage(),
    );
  }
}
