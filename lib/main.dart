import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 10,
          toolbarHeight: 100
        ),
      textTheme: TextTheme(bodyLarge: TextStyle(), bodyMedium: TextStyle()).apply(bodyColor: Colors.white, displayColor: Colors.white)
      ),
    ),
  );
}
