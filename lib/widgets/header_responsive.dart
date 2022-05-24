import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_site/util/util_general.dart';
import 'package:meu_site/util/util_msg_br.dart';
import 'package:meu_site/util/util_msg_eg.dart';
import 'package:meu_site/widgets/responsive.dart';


class HeaderResponsiveSmall extends StatelessWidget {
  HeaderResponsiveSmall({Key? key, required this.english}) : super(key: key);
  var english = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;


    return Container(
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Center(
            child: Container(
            height: 200,
                child: CircularProfileAvatar(
          '',
          elevation: 50,
          backgroundColor: Colors.black,
          borderColor: Colors.white,
          borderWidth: 3,
          child: Image.asset('assets/images/foto.jpg',
            fit: BoxFit.cover,
          ),
          radius: 135,
        )
        )),
        SizedBox(height: 20,),
        Flexible(child: Text(
          'ALISSON ANDRADE',
          style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.blueGrey,
                  offset: Offset(5.0, 5.0),
                ),
              ]
          ),
        ),),
        Padding(padding: EdgeInsets.only(bottom: 20),
        child:  Flexible(child: AnimatedCrossFade(
            firstChild:  Text(
              english ? UtilMsgEg.subTitle : UtilMsgBr.subTitle,
              style: GoogleFonts.montserrat(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.blueGrey,
                      offset: Offset(5.0, 5.0),
                    ),
                  ]
              ),
            ),
            secondChild:  Text(
              english ? UtilMsgEg.subTitle : UtilMsgBr.subTitle,
              style: GoogleFonts.montserrat(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.blueGrey,
                      offset: Offset(5.0, 5.0),
                    ),
                  ]
              ),
            ),
            crossFadeState: english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: UtilGeneral.duTrans)),
        ),

      ],
    ));
  }
}


class HeaderLarge extends StatelessWidget {


  HeaderLarge({Key? key, required this.english}) : super(key: key);

  var english = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          height: 300,
          width: 300,
          padding: ResponsiveWidget.isLargeScreen(context) ? EdgeInsets.only(top: 10) : EdgeInsets.only(top: 10),
          child:Center( child: Tooltip(
            showDuration: UtilGeneral.duTrans,
            padding: EdgeInsetsDirectional.only(end: 350),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            textStyle: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            message: english ? UtilMsgEg.helloMsg : UtilMsgBr.helloMsg,
            child:  CircularProfileAvatar(
              '',
              elevation: 50,
              backgroundColor: Colors.black,
              borderColor: Colors.white,
              borderWidth: 3,
              child: Image.asset('assets/images/foto.jpg',
                fit: BoxFit.cover,
              ),
              radius: 150,
            ),
          )
        )),
        Flexible(child: Container(
          height: 50,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Text(
                'ALISSON ANDRADE',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        color: Colors.blueGrey,
                        offset: Offset(5.0, 5.0),
                      ),
                    ]
                ),
              ),),
              Flexible(child: AnimatedCrossFade(
                  firstChild: Text(
                  UtilMsgEg.subTitle,
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.blueGrey,
                            offset: Offset(5.0, 5.0),
                          ),
                        ]
                    ),
                  ),
                  secondChild: Text(
                    UtilMsgBr.subTitle,
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.blueGrey,
                            offset: Offset(5.0, 5.0),
                          ),
                        ]
                    ),
                  ),
                  crossFadeState: english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: UtilGeneral.duTrans))
            ],
          ),)
        ),

      ],
    );
  }
}

