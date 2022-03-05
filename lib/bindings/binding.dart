import 'package:get/get.dart';
import 'package:test_pilarmedia/controller/controller_detail.dart';
import 'package:test_pilarmedia/controller/controller_now_playing.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerDetail());
    Get.put(ControllerNowPlaying());
  }
}
