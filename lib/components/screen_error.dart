import 'package:flutter/material.dart';

Widget screenError(String errorMessage, Widget buttonReload) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 50,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    bottomNavigationBar: buttonReload,
  );
}
