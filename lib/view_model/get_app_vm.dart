import 'package:flutter/foundation.dart';
import 'package:flutter_app_challenge/model/apis/main_api.dart';
import 'package:flutter_app_challenge/model/app_model.dart';
import 'package:get/get.dart';

class FLutterAppController extends GetxController {
  final MainAppFetch _appFetch = MainAppFetch(); //API Service class
  final RxList<FlutterAppChalModel> _myList =
      <FlutterAppChalModel>[].obs; // data list
  RxList<FlutterAppChalModel> localList =
      <FlutterAppChalModel>[].obs; // local data list
  RxBool isloading = false.obs; //checking api status

  RxList<FlutterAppChalModel> get getDataList {
    return _myList;
  }

  void writeData(RxList<FlutterAppChalModel> list) {
    print("1111111111111111 write");
    try {} catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future readData() async {
    try {
      print("222222222222222222 read");
      localList.obs;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return;
    }
  }

  //This function is used to fetch data from API
  Future getData() async {
    isloading.value = true;
    try {
      await _appFetch.fetchAPIData().onError((error, stackTrace) {
        isloading.value = false;
      }).then((value) {
        if (kDebugMode) {
          print("Request completed");
        }
        for (var element in value) {
          _myList.add(
            FlutterAppChalModel.fromJson(element as Map<String, dynamic>),
          );
        }
        isloading.value = false;
        _myList.refresh();
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
