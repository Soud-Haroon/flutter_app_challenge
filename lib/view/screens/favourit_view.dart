import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/model/widgets/list_view_widget.dart';
import 'package:flutter_app_challenge/view/screens/detail_screen.dart';
import 'package:flutter_app_challenge/view_model/get_app_vm.dart';
import 'package:get/get.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({super.key});

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
        child: _appController.localList.isNotEmpty
            ? ListView.builder(
                itemCount: _appController.localList.length,
                itemBuilder: (contxt, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: InkWell(
                      onTap: () => Get.to(() => OwnerDetailScreen(
                            key: widget.key,
                            appChalModel: _appController.localList[index],
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
