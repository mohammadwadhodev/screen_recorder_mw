import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_recoder_mw/global/constants/constants.dart';

import '../controllers/start_recording_controller.dart';

class StartRecordingWidget extends GetView<StartRecordingController> {

  double opacity = 0.0;

   StartRecordingWidget({
    required this.opacity,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: Get.height * 0.87,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: opacity,
              child: Center(
                child: Container(
                  height: Get.height * 0.1,
                  width:Get.width > 480 ? Get.width * 0.62 : Get.width,
                  decoration: customDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => CupertinoButton(
                            onPressed: controller.isStart.value ? null : () => controller.startRecording(),
                            minSize: 0,
                            padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.not_started,
                            size: 35,
                            color:controller.isStart.value ?  kDisableIconBG : kEnableIconBG,
                          ),
                          ),
                        ),
                       Obx(() =>  CupertinoButton(
                              onPressed: controller.isStart.value == false ? null : () => controller.endRecording(),
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              child: Icon(Icons.stop_circle, size: 35, color:controller.isStart.value ? Colors.red.withOpacity(0.8):kDisableIconBG)
                              ),
                            ),


                        Obx(() => CupertinoButton(
                            onPressed: controller.isStart.value == false || controller.isPause.value ? null : () => controller.pauseRecording(),
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.pause_circle,
                              size: 35,
                              color: controller.isPause.value ? kActiveBlue :controller.isStart.value ?kEnableIconBG : kDisableIconBG,
                            ),
                          ),
                        ),
                        Obx(() => CupertinoButton(
                            onPressed: controller.isPause.value == false ? null : () => controller.resumeRecording(),
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.play_circle,
                              size: 35,
                              color:controller.isPause.value ? kEnableIconBG : kDisableIconBG
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration customDecoration(){
    return BoxDecoration(
        color:kEnableBG,
        borderRadius: BorderRadius.circular(30)
    );
  }

}
