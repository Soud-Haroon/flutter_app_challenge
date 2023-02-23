import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/model/widgets/circle_progress.dart';
import 'package:flutter_app_challenge/model/widgets/list_view_widget.dart';
import 'package:flutter_app_challenge/view/screens/detail_screen.dart';
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
    return Scaffold(
      key: widget.key,
      appBar: _myAppBar(),
      body: Center(
        child: _listBuilder(context),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Get"),
        onPressed: () => _appController.getData(),
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
      () => _appController.isloading.value == false
          ? _appController.getDataList.isNotEmpty
              ? ListView.builder(
                  itemCount: _appController.getDataList.length,
                  itemBuilder: (contxt, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: InkWell(
                        onTap: () => Get.to(() => OwnerDetailScreen(
                              key: widget.key,
                              appChalModel: _appController.getDataList[index],
                            )),
                        child: ListWidgetUser(
                          key: widget.key,
                          chalModel: _appController.getDataList[index],
                        ),
                      ),
                    );
                  },
                )
              : const Text("No data available!")
          : circleLoader(context),
    );
  }
}
