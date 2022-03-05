import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/components/screen_error.dart';
import 'package:test_pilarmedia/components/screen_load.dart';
import 'package:test_pilarmedia/controller/controller_detail.dart';

import 'components/detail_data.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);
  static String namePage = "/Detail";

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  ControllerDetail controllerDetail = Get.put(ControllerDetail());

  getData() {
    var id = Get.arguments["id"];
    controllerDetail.getdetail(id.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerDetail>(builder: (value) {
      return value.load
          ? screenLoad()
          : value.errormessage == null
              ? DetailData(data: value.detailNowPlaying!)
              : screenError(
                  value.errormessage ?? "Error",
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: getData(),
                      child: const Text("Reload"),
                    ),
                  ),
                );
    });
  }
}
