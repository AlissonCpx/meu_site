import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';

class UtilGeneral {
  static Duration duTrans = Duration(milliseconds: 800);
  static Duration duVeloScroll = Duration(seconds: 1);
  static var sessionAbout = 300;

  Widget animatedCha(String text1, text2, bool english, TextStyle style) {
    return AnimatedCrossFade(
        firstChild: Text(text1, style: style),
        secondChild: Text(text2, style: style),
        crossFadeState:
            english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: UtilGeneral.duTrans);
  }

  String convertDate(String date) {
    return formatDate(DateTime.parse(date), [dd, '/', mm, '/', yyyy]);
  }
}
