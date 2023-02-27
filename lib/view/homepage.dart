import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/model/widgets/list_view_widget.dart';
import 'package:flutter_app_challenge/view/screens/detail_screen.dart';
import 'package:flutter_app_challenge/view/screens/favourit_view.dart';
import 'package:flutter_app_challenge/view_model/get_app_vm.dart';
import 'package:get/get.dart';

//===============Main Page=====================//
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FLutterAppController _appController = Get.put(FLutterAppController());

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: _myAppBar(),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: Center(
          child: _listBuilder(context),
        ),
      ),
    );
  }

  //======auto load data func=======//
  Future _loadData() async {
    _appController.getData();
  }

  //======custom app bar=======//
  AppBar _myAppBar() {
    return AppBar(
      title: Text(widget.title),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () => Get.to(FavouriteView()),
              icon: const Icon(
                Icons.star,
                color: Colors.amber,
              )),
        )
      ],
    );
  }

  //======custom list view builder widget=======//
  Widget _listBuilder(BuildContext contxt) {
    return Obx(() => ListView.builder(
          itemCount: _appController.getDataList.length,
          itemBuilder: (contxt, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: InkWell(
                onTap: () => Get.to(() => DetailScreen(
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
        ));
  }
}
