import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localllllll/main_screen.dart';
import 'package:localllllll/profile.dart';
import 'package:localllllll/setting_screen.dart';
import 'package:localllllll/OnBoardingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingPage(),
      
    );
  }
}
