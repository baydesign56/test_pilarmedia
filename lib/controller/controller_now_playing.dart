import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/models/model_list_now_playing.dart';
import 'package:test_pilarmedia/services/api_key.dart';
import 'package:test_pilarmedia/services/base_url.dart';
import 'package:test_pilarmedia/services/dio_services.dart';
import 'package:test_pilarmedia/services/error_message.dart';

class ControllerNowPlaying extends GetxController {
  bool load = false;
  String? errormessage;
  ModelListNowPlaying? modelListNowPlaying;

  getNowPlaying() async {
    load = true;
    errormessage = null;
    update();
    try {
      var res = await DioServices.dio.get(
        baseUrlMovie + "now_playing?api_key=$apikey",
      );
      if (res.statusCode == 200) {
        log(res.data);
        modelListNowPlaying = modelListNowPlayingFromJson(res.data);
        load = false;
        update();
      } else {
        errormessage = res.statusMessage;
        load = false;
        update();
      }
    } on DioError catch (e) {
      errorMessage(e.type).then((value) {
        errormessage = value;
        load = false;
        update();
      });
    }
    update();
  }
}
