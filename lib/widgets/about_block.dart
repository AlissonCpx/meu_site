import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_site/util/util_general.dart';
import 'package:meu_site/util/util_msg_br.dart';
import 'package:meu_site/util/util_msg_eg.dart';
import 'package:meu_site/widgets/responsive.dart';

class AboutBlock extends StatelessWidget {
  var english = true;

  AboutBlock({
    Key? key,
    required this.screenSize,
    required this.english,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: Container(
             margin: EdgeInsets.all(10),
              child: Card(
                elevation: 20,
                child: Column(
                  children: [
                    AnimatedCrossFade(
                        firstChild: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(UtilMsgEg.about,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ),
                        secondChild: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(UtilMsgBr.about,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                        ),
                        crossFadeState: english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: UtilGeneral.duTrans),
                  ],
                ),
              ),
            )
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Container(
              child: Card(
                child: Column(
                  children: [
                    AnimatedCrossFade(
                        firstChild: Padding(
                padding: EdgeInsets.all(20),
                  child: Text(UtilMsgEg.about,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
              ),
                        secondChild: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(UtilMsgBr.about,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                        ),
                        crossFadeState: english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: UtilGeneral.duTrans)
                  ],
                ),
              ),
            )
          );
  }
}
