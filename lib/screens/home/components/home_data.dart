import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/components/card_home.dart';
import 'package:test_pilarmedia/controller/controller_now_playing.dart';
import 'package:test_pilarmedia/screens/search/search.dart';

class HomeData extends StatefulWidget {
  const HomeData({Key? key}) : super(key: key);

  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerNowPlaying>(builder: (value) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Movie App"),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Search.namePage);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: value.modelListNowPlaying == null ||
                value.modelListNowPlaying!.results == null ||
                value.modelListNowPlaying!.results!.isEmpty
            ? const Center(
                child: Text("Tidak ada movie"),
              )
            : PageView(
                scrollDirection: Axis.vertical,
                children: [
                  for (var item in value.modelListNowPlaying!.results!)
                    CardHome(item: item),
                ],
              ),
      );
    });
  }
}
