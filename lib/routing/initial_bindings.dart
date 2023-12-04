import 'package:get/get.dart';

import '../app/controllers/home_screen_controller.dart';
import '../app/controllers/start_recording_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => StartRecordingController());
  }
}