
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_site/widgets/bottom_bar.dart';
import 'package:meu_site/widgets/carousel.dart';
import 'package:meu_site/widgets/destination_heading.dart';
import 'package:meu_site/widgets/explore_drawer.dart';
import 'package:meu_site/widgets/featured_heading.dart';
import 'package:meu_site/widgets/featured_tiles.dart';
import 'package:meu_site/widgets/floating_quick_access_bar.dart';
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
      backgroundColor: Colors.white,
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
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
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
                   colors: [
                      Colors.blueGrey,
                    Colors.white
                  ],
                  )
                ),
                 child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center( child: CircularProfileAvatar(
                          '',
                          elevation: 50,
                          backgroundColor: Colors.black,
                          borderColor: Colors.white,
                          borderWidth: 3,
                          child: Image.asset('assets/images/foto.jpg',
                            fit: BoxFit.cover,
                          ),
                          radius: 180,
                        )

                        ),
                       Flexible(child: Container(
                            height: 50,
                            child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(child: Text(
                                'ALISSON ANDRADE',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 20,
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
                              Flexible(child: Text(
                                'DESENVOLVEDOR',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black54,
                                  fontSize: 20,
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
                              ),)
                            ],
                          ),)
                        ),

                      ],
                    ),

                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    Container(
                      child: Column(
                        children: [
                          FeaturedHeading(
                            screenSize: screenSize,
                          ),
                          FeaturedTiles(screenSize: screenSize)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            //SizedBox(height: screenSize.height / 8),
            DestinationHeading(screenSize: screenSize),
            DestinationCarousel(),
            SizedBox(height: screenSize.height / 10),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
