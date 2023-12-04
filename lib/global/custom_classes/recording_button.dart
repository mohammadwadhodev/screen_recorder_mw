import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_recoder_mw/global/constants/constants.dart';

class RecordingButton extends StatelessWidget {
  String icon;
  String title;
  Color containerColor;
  Color textColor;
  double homeWidgetsOpacity;
  bool isSelected;
  void Function()? onTap;

   RecordingButton({
    required this.containerColor,
    required this.icon,
    required this.title,
    required this.textColor,
    required this.homeWidgetsOpacity,
    required this.onTap,
    required this.isSelected,
    super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      minSize: 0,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: AnimatedOpacity(
            duration: const Duration(seconds: 5),
            opacity: homeWidgetsOpacity,
            child: Container(
              height:Get.width > 480 ? Get.height * 0.3 : Get.height * 0.3,
              width:Get.width > 480 ? Get.width * 0.3 : Get.width * 0.9,
              decoration: customDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: customRadio()),
                    SizedBox(
                      height: Get.width > 480 ? 80 : 150,
                      child: Image.asset(icon),
                    ),
                    const SizedBox(height: 10),
                    Text(title,style: GoogleFonts.exo2(
                      textStyle: TextStyle(fontSize: 25,color: textColor)
                    ))
                  ],
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
      color:containerColor,
      borderRadius: BorderRadius.circular(30)
    );
  }


  Widget customRadio(){
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: kAppColor,
        shape: BoxShape.circle
      ),
      child: isSelected ? selectedIcon() : const SizedBox(),
    );
  }

  Widget selectedIcon(){
    return Center(
      child: Container(
        height: 22,
        width: 22,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.cyan
        ),
      ),
    );
  }



}
