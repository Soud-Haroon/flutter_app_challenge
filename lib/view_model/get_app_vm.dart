import 'package:flutter/foundation.dart';
import 'package:flutter_app_challenge/model/apis/main_api.dart';
import 'package:flutter_app_challenge/model/app_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FLutterAppController extends GetxController {
  final MainAppFetch _appFetch = MainAppFetch(); //API Service class
  final RxList<FlutterAppChalModel> _myList =
      <FlutterAppChalModel>[].obs; // data list
  RxList<FlutterAppChalModel> _localList =
      <FlutterAppChalModel>[].obs; // local data list
  RxBool isloading = false.obs; //checking api status

  RxList<FlutterAppChalModel> get getDataList {
    return _myList;
  }
  RxList<FlutterAppChalModel> get getLocalList {
    return _localList;
  }

  //This function is used to fetch data from API
  Future getData() async {
    isloading.value = true;
    try {
      await _appFetch.fetchData().onError((error, stackTrace) {
        isloading.value = false;
        _myList.clear();
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
        print("debug error: $error");
      }
      return _myList.obs;
    }
  }

  Future<void> writeData(RxList<FlutterAppChalModel> list) async {
    try {
      final pref = await SharedPreferences.getInstance();
      pref.setStringList("keyData", list as List<String>);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future readData() async {
    try {
      final pref = await SharedPreferences.getInstance();
      _localList = pref.getStringList("keyData") as RxList<FlutterAppChalModel>;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
