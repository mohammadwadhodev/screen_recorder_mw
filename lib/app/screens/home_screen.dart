import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_recoder_mw/app/screens/start_recording_widget.dart';
import 'package:screen_recoder_mw/global/constants/constants.dart';
import 'package:screen_recoder_mw/global/custom_classes/recording_button.dart';

import '../../global/custom_classes/resuable_classes.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const InitialContainer(),
        Obx(() => ShowLabelText(opacity: controller.homeWidgetsOpacity.value)),
        const ShowHomeWidgets(),
        Obx(() => StartRecordingWidget(opacity:controller.recordingWidgetOpacity.value),
        ),
      ],
    );
  }
}

class ShowHomeWidgets extends GetView<HomeScreenController> {
  const ShowHomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
        duration: const Duration(seconds: 2),
        top: Get.width > 480 ? 250 : 190,
        left: 0,
        right: controller.showWidgetsLeft.value,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Get.width < 480 ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => RecordingButton(
                      onTap: () => controller.toggleValues('screen'),
                      title: "Screen",
                      icon:controller.isScreenSelected.value ? kEnabledScreenIcon : kDisabledScreenIcon,
                      containerColor:controller.isScreenSelected.value ?kEnableBG : kDisableBG,
                      textColor:controller.isScreenSelected.value ?kTextColorEnabled : kTextColorDisabled,
                      homeWidgetsOpacity:controller.homeWidgetsOpacity.value,
                      isSelected: controller.isScreenSelected.value,
                  ),
               ),

              const SizedBox(height: 20),
             Obx(() => RecordingButton(
                  onTap: () => controller.toggleValues('webcam'),
                      title: "Webcam",
                 icon:controller.isWebCamSelected.value ? kEnabledWebcamIcon : kDisabledWebcamIcon,
                 containerColor:controller.isWebCamSelected.value ?kEnableBG : kDisableBG,
                 textColor:controller.isWebCamSelected.value ?kTextColorEnabled : kTextColorDisabled,
                 homeWidgetsOpacity:controller.homeWidgetsOpacity.value,
                isSelected: controller.isWebCamSelected.value,

                  ),
              ),
            ],
          ):Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => RecordingButton(
                onTap: () => controller.toggleValues('screen'),
                title: "Screen",
                icon:controller.isScreenSelected.value ? kEnabledScreenIcon : kDisabledScreenIcon,
                containerColor:controller.isScreenSelected.value ?kEnableBG : kDisableBG,
                textColor:controller.isScreenSelected.value ?kTextColorEnabled : kTextColorDisabled,
                homeWidgetsOpacity:controller.homeWidgetsOpacity.value,
                isSelected: controller.isScreenSelected.value,
              ),
              ),

              const SizedBox(width: 20),
              Obx(() => RecordingButton(
                onTap: () => controller.toggleValues('webcam'),
                title: "Webcam",
                icon:controller.isWebCamSelected.value ? kEnabledWebcamIcon : kDisabledWebcamIcon,
                containerColor:controller.isWebCamSelected.value ?kEnableBG : kDisableBG,
                textColor:controller.isWebCamSelected.value ?kTextColorEnabled : kTextColorDisabled,
                homeWidgetsOpacity:controller.homeWidgetsOpacity.value,
                isSelected: controller.isWebCamSelected.value,

              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

