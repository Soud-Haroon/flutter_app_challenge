import 'package:flutter/foundation.dart';
import 'package:flutter_app_challenge/model/apis/main_api.dart';
import 'package:flutter_app_challenge/model/app_model.dart';
import 'package:get/get.dart';

class FLutterAppController extends GetxController {
  final MainAppFetch _appFetch = MainAppFetch();
  final List<FlutterAppChalModel> _flutterAppChalModel = [];
  List<FlutterAppChalModel> _data = [];
  RxList rxData = [].obs;

  List<FlutterAppChalModel> get getDataList {
    return _data.obs;
  }

  Future getData() async {
    await _appFetch.fetchAPIData().then((value) {
      if (kDebugMode) {
        print("completed");
      }
      for (var element in value) {
        _flutterAppChalModel.add(
          FlutterAppChalModel.fromJson(element as Map<String, dynamic>),
        );
      }
      _data = _flutterAppChalModel;
      _data.obs;
      rxData = _data as RxList;
    });
  }
}
