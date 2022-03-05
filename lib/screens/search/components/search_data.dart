import 'package:flutter/material.dart';
import 'package:test_pilarmedia/models/model_list_now_playing.dart';
import 'package:test_pilarmedia/screens/search/components/card_searh.dart';

Widget searchData({List<Result>? data}) {
  return data == null || data.isEmpty
      ? SizedBox.expand(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.hourglass_empty_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Film tidak ditemukan"),
              ],
            ),
          ),
        )
      : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                for (var item in data) cardSearch(item),
              ],
            ),
          ),
        );
}
