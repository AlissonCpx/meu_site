import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_site/util/util_msg_br.dart';
import 'package:meu_site/util/util_msg_eg.dart';
import 'package:meu_site/widgets/bottom_bar.dart';
import 'package:meu_site/widgets/carousel.dart';
import 'package:meu_site/widgets/destination_heading.dart';
import 'package:meu_site/widgets/explore_drawer.dart';
import 'package:meu_site/widgets/about_heading.dart';
import 'package:meu_site/widgets/about_block.dart';
import 'package:meu_site/widgets/floating_quick_access_bar.dart';
import 'package:meu_site/widgets/header_responsive.dart';
import 'package:meu_site/widgets/responsive.dart';
import 'package:meu_site/widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = new ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  bool _english = true;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: _english ? UtilMsgBr.placeHoldLang : UtilMsgEg.placeHoldLang,
        elevation: 30,
        mini: true,
        foregroundColor: Colors.blueGrey,
        child: CircularProfileAvatar(_english == false ? 'assets/images/eu.png' : 'assets/images/brasil.png',
        animateFromOldImageOnUrlChange: true,
          foregroundColor: Colors.blueGrey,
        ),
        onPressed: () {
          setState(() {
              _english = !_english;
          });
        },
      ),
      backgroundColor: Colors.white10,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey[900]!.withOpacity(_opacity),
              elevation: 0,
              title: Text(
                '',
                style: GoogleFonts.montserrat(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: Opacity(opacity: _opacity, child: TopBarContents(1, _english)),
            ),
      drawer: ExploreDrawer(english: _english),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blueGrey, Colors.white],
                    )),
                    child: Opacity(
                        opacity: 1 - _opacity,
                        child: Container(
                          child: ResponsiveWidget.isSmallScreen(context)
                              ? HeaderResponsiveSmall(english: _english,)
                              : HeaderLarge(english: _english),
                        ))),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize, english: _english),
                    Container(
                      child: Column(
                        children: [
                          //Divider(height: 20,),
                          AboutHeading(
                            screenSize: screenSize,
                            english: _english,
                          ),
                          AboutBlock(screenSize: screenSize, english: _english,)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),

            //SizedBox(height: screenSize.height / 8),
            //DestinationHeading(screenSize: screenSize),
            //DestinationCarousel(),
            SizedBox(height: screenSize.height / 10),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
