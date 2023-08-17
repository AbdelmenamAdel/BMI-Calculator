import 'package:bmi_calc/bmi/Bmi_Calculator.dart';
import 'package:bmi_calc/shrdprfs.dart';
import 'package:flutter/material.dart';

import '../Core/Services/Service_locator.dart';
import '../Core/database/cacheHelper.dart';
import '../loginScreen.dart';

bool isVisited = sl<CacheHelper>().getData(key: 'loged') ?? false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: isVisited ? const BmiCalculator() : const LoginScreen(),
      home: SharedPref(),
    );
  }
}
