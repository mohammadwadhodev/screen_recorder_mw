import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_recoder_mw/global/constants/constants.dart';

class InitialContainer extends StatelessWidget {
  const InitialContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(kBackgroundImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            CupertinoColors.black.withOpacity(0.5),
            BlendMode.darken
          )
        )
      ),
    );
  }
}

class ShowLabelText extends StatelessWidget {

  double opacity = 0.0;

   ShowLabelText({
    required this.opacity,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.width > 480 ? 10 : 60,
      left: Get.width > 480 ? 50 : 10,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           LabelText(text: 'Enjoy your',color: kActiveBlue,opacity:opacity),
           LabelText(text: 'Free',color: kActiveOrange,opacity:opacity),
           LabelText(text: 'Recordings',color: kActiveGreen,opacity:opacity),

          ],
        ),
      )
    );
  }
}


class LabelText extends StatelessWidget {

  String text = '';
  Color color;
  double opacity = 0.0;

  LabelText({
    required this.text,
    required this.color,
    required this.opacity,

    super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(seconds: 2),
      opacity: opacity,
      child: Text(text,
      style: GoogleFonts.exo2(
        color: color,
        fontSize: Get.width > 480 ? 50 : 30
      )

      ),
    );
  }
}


