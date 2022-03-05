import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/components/screen_error.dart';
import 'package:test_pilarmedia/components/screen_load.dart';
import 'package:test_pilarmedia/controller/controller_now_playing.dart';

import 'components/home_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String namePage = "/Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ControllerNowPlaying controllerNowPlaying = Get.put(ControllerNowPlaying());

  @override
  void initState() {
    super.initState();
    controllerNowPlaying.getNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerNowPlaying>(builder: (value) {
      return value.load
          ? screenLoad()
          : value.errormessage == null
              ? const HomeData()
              : screenError(
                  value.errormessage ?? "Error",
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: () {
                        controllerNowPlaying.getNowPlaying();
                      },
                      child: const Text("Reload"),
                    ),
                  ),
                );
    });
  }
}
