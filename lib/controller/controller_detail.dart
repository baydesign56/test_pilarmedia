import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/models/model_detail_now_playing.dart';
import 'package:test_pilarmedia/services/api_key.dart';
import 'package:test_pilarmedia/services/base_url.dart';
import 'package:test_pilarmedia/services/dio_services.dart';
import 'package:test_pilarmedia/services/error_message.dart';

class ControllerDetail extends GetxController {
  bool load = false;
  String? errormessage;
  ModelDetailNowPlaying? detailNowPlaying;

  getdetail(String id) async {
    load = true;
    errormessage = null;
    update();
    try {
      var res = await DioServices.dio.get(
        baseUrlMovie + "$id?api_key=$apikey",
      );
      if (res.statusCode == 200) {
        log(res.data);
        detailNowPlaying = modelDetailNowPlayingFromJson(res.data);
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
