import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/view_model/get_app_vm.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FLutterAppController _appController = Get.put(FLutterAppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _myAppBar(),
        body: Center(
          child: _listBuilder(context),
          // ListView.builder(
          //   itemCount: _appController.getDataList.length,
          //   itemBuilder: (contxt, index) {
          //     return Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: Text(
          //         _appController.getDataList[index].name!,
          //       ),
          //     );
          //   },
          // ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text("Get"),
          onPressed: () => _appController.getData(),
        ),
      ),
    );
  }

  AppBar _myAppBar() {
    return AppBar(
      title: Text(widget.title),
    );
  }

  Widget _listBuilder(BuildContext contxt) {
    return Obx(
      () => ListView.builder(
        itemCount: _appController.getDataList.length,
        itemBuilder: (contxt, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              _appController.getDataList[index].name!,
            ),
          );
        },
      ),
    );
  }
}
