import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_pilarmedia/models/model_detail_now_playing.dart';

Widget productionCompany(List<ProductionCompany> company) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 30,
      ),
      const Text(
        "Production Companies",
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
          for (var item in company)
            Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(item.name ?? "Name")),
        ],
      ),
    ],
  );
}
