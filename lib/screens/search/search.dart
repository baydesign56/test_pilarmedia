import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/components/screen_error.dart';
import 'package:test_pilarmedia/components/screen_load.dart';
import 'package:test_pilarmedia/controller/controller_search.dart';

import 'components/search_data.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  static String namePage = "/Search";

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  ControllerSearch search = Get.put(ControllerSearch());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerSearch>(builder: (value) {
      return Scaffold(
          appBar: AppBar(
            title: TextField(
              autofocus: true,
              textInputAction: TextInputAction.search,
              controller: controller,
              onChanged: (value) {
                setState(() {});
              },
              onSubmitted: (value) {
                search.search(value);
              },
            ),
          ),
          body: value.load
              ? screenLoad()
              : value.errormessage == null
                  ? value.modelListNowPlaying == null
                      ? const Center(child: Text("Cari Nama Film"))
                      : searchData(data: value.modelListNowPlaying!.results!)
                  : screenError(
                      value.errormessage ?? "Error",
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          onPressed: () {
                            search.search(controller.text);
                          },
                          child: const Text("Reload"),
                        ),
                      ),
                    ));
    });
  }
}
