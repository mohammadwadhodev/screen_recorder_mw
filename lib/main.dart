import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_recoder_mw/routing/app_pages.dart';
import 'package:screen_recoder_mw/routing/app_routes.dart';
import 'package:screen_recoder_mw/routing/initial_bindings.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    );
  }
}
