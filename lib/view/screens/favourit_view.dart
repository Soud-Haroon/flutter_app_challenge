import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/model/widgets/list_view_widget.dart';
import 'package:flutter_app_challenge/view/screens/detail_screen.dart';
import 'package:flutter_app_challenge/view_model/get_app_vm.dart';
import 'package:get/get.dart';

//================Favourite class view=================//
class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  final FLutterAppController _appController = Get.put(FLutterAppController());

  @override
  void initState() {
    _appController.readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourite's")),
      body: Center(
        child: _appController.getLocalList.isNotEmpty
            ? ListView.builder(
                itemCount: _appController.getLocalList.length,
                itemBuilder: (contxt, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: InkWell(
                      onTap: () => Get.to(() => DetailScreen(
                            key: widget.key,
                            appChalModel: _appController.getLocalList[index],
                          )),
                      child: ListWidgetUser(
                        key: widget.key,
                        chalModel: _appController.getDataList[index],
                      ),
                    ),
                  );
                },
              )
            : const Text("No data available!"),
      ),
    );
  }
}
