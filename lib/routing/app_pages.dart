import 'package:get/get.dart';

import '../app/screens/home_screen.dart';
import 'app_routes.dart';
import 'initial_bindings.dart';

class AppPages{
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: ()=> const HomeScreen(),
      binding: InitialBinding(),
    )
  ];
}