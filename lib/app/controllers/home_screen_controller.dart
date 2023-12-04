import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  RxDouble homeWidgetsOpacity = 0.0.obs;
  RxDouble showWidgetsLeft = 0.0.obs;
  RxDouble recordingWidgetOpacity = 0.0.obs;

  RxBool isScreenSelected = false.obs;
  RxBool isWebCamSelected = false.obs;



  Future<void> setIntroTextAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    showWidgetsLeft.value = 0;
    homeWidgetsOpacity.value = 1.0;
  }


  void toggleValues(tile){
    if(tile == "screen"){
      isScreenSelected.value = !isScreenSelected.value;
      isWebCamSelected.value = false;
    }else{
      if(isScreenSelected.value){
        isWebCamSelected.value = !isWebCamSelected.value;
      }
    }
    isScreenSelected.value ? showRecordingWidget() : hideRecordingWidget();
  }

  showRecordingWidget() => recordingWidgetOpacity.value  = 1.0;
  hideRecordingWidget() => recordingWidgetOpacity.value = 0.0;


  @override
  void onInit() {
    showWidgetsLeft.value = Get.width > 480 ? -3000.0.obs : -1200.0.obs;
    setIntroTextAnimation();
    super.onInit();
  }

}