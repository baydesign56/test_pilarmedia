import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/models/model_list_now_playing.dart';
import 'package:test_pilarmedia/services/dio_services.dart';
import 'package:test_pilarmedia/services/error_message.dart';

class ControllerSearch extends GetxController {
  bool load = false;
  String? errormessage;
  ModelListNowPlaying? modelListNowPlaying;

  search(String query) async {
    load = true;
    errormessage = null;
    update();
    try {
      var res = await DioServices.dio.get(
        "https://api.themoviedb.org/3/search/movie?query=$query&api_key=fbb9572d11b5458ac98f02b84f2bafc4",
      );
      log(res.realUri.path);
      if (res.statusCode == 200) {
        // log(res.data);
        modelListNowPlaying = modelListNowPlayingFromJson(res.data);
        load = false;
        update();
      } else {
        log(res.data);
        errormessage = res.statusMessage;
        load = false;
        update();
      }
    } on DioError catch (e) {
      log(e.message);
      errorMessage(e.type).then((value) {
        errormessage = value;
        load = false;
        update();
      });
    }
    update();
  }
}
