import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/models/model_list_now_playing.dart';
import 'package:test_pilarmedia/screens/detail/detail.dart';

Widget cardSearch(Result data) {
  return InkWell(
    onTap: () {
      Get.toNamed(Detail.namePage, arguments: {"id": data.id});
    },
    child: Container(
      padding: const EdgeInsets.fromLTRB(20, 7.5, 20, 7.5),
      width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: Get.width / 3,
              height: Get.width / 3,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/" + data.posterPath.toString(),
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: Get.width / 2,
              child: Text(
                data.title.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(width: 5),
                Text(
                  data.popularity.toString(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(width: 5),
                Text(
                  data.voteAverage.toString() +
                      " | " +
                      data.voteCount.toString(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    ),
  );
}
