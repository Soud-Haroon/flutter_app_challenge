import 'package:flutter_app_challenge/view_model/get_app_vm.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FLutterAppController());
  }
}
