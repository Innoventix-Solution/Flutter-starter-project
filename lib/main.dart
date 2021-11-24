import 'package:flutter/material.dart';
import 'package:flutter_starter_project/utils/colors.dart';
import 'package:flutter_starter_project/utils/constants.dart';

import 'screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: const Splash(),
    );
  }
}
