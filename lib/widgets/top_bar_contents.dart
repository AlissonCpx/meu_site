import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_site/util/util_general.dart';
import 'package:meu_site/util/util_msg_br.dart';
import 'package:meu_site/util/util_msg_eg.dart';
import 'package:meu_site/widgets/app_bar_button.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  var english = true;

  TopBarContents(this.opacity, this.english);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.blueGrey[900]!.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    AnimatedCrossFade(
                        firstChild: AppBarButton(texto: UtilMsgEg.aboutTitle),
                        secondChild: AppBarButton(texto: UtilMsgBr.aboutTitle),
                        crossFadeState: widget.english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: UtilGeneral.duTrans),
                    SizedBox(width: screenSize.width / 20),

                    AnimatedCrossFade(
                        firstChild: AppBarButton(texto: UtilMsgEg.projectTitle),
                        secondChild: AppBarButton(texto: UtilMsgBr.projectTitle),
                        crossFadeState: widget.english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: UtilGeneral.duTrans),
                    SizedBox(width: screenSize.width / 20),
                    AnimatedCrossFade(
                        firstChild: AppBarButton(texto: UtilMsgEg.contactTitle),
                        secondChild: AppBarButton(texto: UtilMsgBr.contactTitle),
                        crossFadeState: widget.english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: UtilGeneral.duTrans),
                    SizedBox(width: screenSize.width / 20),
                    AnimatedCrossFade(
                        firstChild: AppBarButton(texto: UtilMsgEg.recommendationsTitle),
                        secondChild: AppBarButton(texto: UtilMsgBr.recommendationsTitle),
                        crossFadeState: widget.english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: UtilGeneral.duTrans),
                  ],
                ),
              ),


              SizedBox(
                width: screenSize.width / 50,
              ),
              AppBarButton(texto: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}
