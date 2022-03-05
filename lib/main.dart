import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pilarmedia/screens/home/home.dart';

import 'bindings/binding.dart';
import 'screens/detail/detail.dart';
import 'screens/search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          textTheme: const TextTheme(
            headline1: TextStyle(),
            headline2: TextStyle(),
            headline3: TextStyle(),
            headline4: TextStyle(),
            headline5: TextStyle(),
            headline6: TextStyle(),
            subtitle1: TextStyle(),
            subtitle2: TextStyle(),
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
            caption: TextStyle(),
            button: TextStyle(),
            overline: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          primarySwatch: Colors.red,
        ),
        initialRoute: Home.namePage,
        initialBinding: Binding(),
        getPages: [
          GetPage(name: Home.namePage, page: () => const Home()),
          GetPage(name: Detail.namePage, page: () => const Detail()),
          GetPage(name: Search.namePage, page: () => const Search())
        ]);
  }
}
