import 'package:get/get.dart';

class StartRecordingController extends GetxController{


  RxBool isStart = false.obs;
  RxBool isPause = false.obs;

  void startRecording()=> isStart.value = true;
  void endRecording() => isStart.value = false;
  void pauseRecording()=> isPause.value = true;
  void resumeRecording()=> isPause.value = false;

}