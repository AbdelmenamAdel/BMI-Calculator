import 'Core/Services/Service_locator.dart';
import 'package:flutter/material.dart';
import 'App/app.dart';
import 'Core/database/cacheHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await sl<CacheHelper>().init();

  runApp(MyApp());
}
