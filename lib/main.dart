import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/model/service/app_binding.dart';
import 'package:flutter_app_challenge/view/homepage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      home: const MyHomePage(title: 'Flutter App Challeng'),
    );
  }
}
