import 'package:flutter/foundation.dart';
import 'package:flutter_app_challenge/model/apis/main_api.dart';
import 'package:flutter_app_challenge/model/app_model.dart';
import 'package:get/get.dart';

class FLutterAppController extends GetxController {
  final MainAppFetch _appFetch = MainAppFetch();
  final RxList<FlutterAppChalModel> _myList = <FlutterAppChalModel>[].obs;
  RxBool isloading = false.obs;

  RxList<FlutterAppChalModel> get getDataList {
    return _myList;
  }

  Future getData() async {
    isloading.value = true;
    await _appFetch.fetchAPIData().then((value) {
      if (kDebugMode) {
        print("completed");
      }
      for (var element in value) {
        _myList.add(
          FlutterAppChalModel.fromJson(element as Map<String, dynamic>),
        );
      }
      isloading.value = false;
      _myList.refresh();
    });
  }
}
