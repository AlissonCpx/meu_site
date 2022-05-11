import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_site/util/util_general.dart';
import 'package:meu_site/util/util_msg_br.dart';
import 'package:meu_site/util/util_msg_eg.dart';
import 'package:meu_site/widgets/responsive.dart';

class ProjectHeading extends StatelessWidget {
  ProjectHeading({
    Key? key,
    required this.screenSize,
    required this.english
  }) : super(key: key);

  final Size screenSize;
  var english = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedCrossFade(
                    firstChild: Text(
                      UtilMsgEg.projectTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    secondChild: Text(
                      UtilMsgBr.projectTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    crossFadeState: english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: UtilGeneral.duTrans),
                SizedBox(height: 5),
                Text(
                  '',
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedCrossFade(
                    firstChild: Text(
                      UtilMsgEg.projectTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    secondChild: Text(
                      UtilMsgBr.projectTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    crossFadeState: english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: UtilGeneral.duTrans),
                Expanded(
                  child: Text(
                    '',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
    );
  }
}
