import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget overView(String overview) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 30,
      ),
      const Text(
        "Overview",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        overview,
      )
    ],
  );
}
