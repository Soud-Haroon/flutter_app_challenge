import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/view_model/get_app_vm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FLutterAppController appController = FLutterAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => appController.getData(),
            child: const Text("Enter to test")),
      ),
    );
  }
}
