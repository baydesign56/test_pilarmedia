import 'package:flutter/material.dart';
import 'package:test_pilarmedia/models/model_detail_now_playing.dart';

Widget spokenLanguage(List<SpokenLanguage> data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 30,
      ),
      const Text(
        "Spoken Languages",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Wrap(
        spacing: 5,
        runSpacing: 5,
        children: [
          for (var item in data)
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(item.name ?? "Name"),
                ],
              ),
            ),
        ],
      ),
    ],
  );
}
