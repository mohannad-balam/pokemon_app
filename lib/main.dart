import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}
