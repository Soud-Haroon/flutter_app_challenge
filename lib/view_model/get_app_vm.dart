import 'package:flutter/foundation.dart';
import 'package:flutter_app_challenge/model/apis/main_api.dart';
import 'package:flutter_app_challenge/model/app_model.dart';
import 'package:get/get.dart';

class FLutterAppController extends GetxController {
  final MainAppFetch _appFetch = MainAppFetch();
  FlutterAppChalModel flutterAppChalModel = FlutterAppChalModel();

  Future getData() async {
    await _appFetch.fetchAPIData().then((value) {
      if (kDebugMode) {
        print("completed");
      }
      flutterAppChalModel = FlutterAppChalModel.fromJson(value);
      if (kDebugMode) {
        print("nodeID: ${flutterAppChalModel.nodeId}");
      }
      flutterAppChalModel.obs;
    });
  }
}
