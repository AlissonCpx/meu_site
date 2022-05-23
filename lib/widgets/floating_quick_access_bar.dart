import 'package:flutter/material.dart';
import 'package:meu_site/util/util_general.dart';
import 'package:meu_site/util/util_msg_br.dart';
import 'package:meu_site/util/util_msg_eg.dart';
import 'package:meu_site/widgets/responsive.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
    required this.english,
    required this.scroll
  }) : super(key: key);

  final ScrollController scroll;
  final Size screenSize;
   var english = true;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List itemsEg = [UtilMsgEg.aboutTitle, UtilMsgEg.projectTitle, UtilMsgEg.contactTitle, UtilMsgEg.recommendationsTitle];

  List itemsBr = [UtilMsgBr.aboutTitle, UtilMsgBr.projectTitle, UtilMsgBr.contactTitle, UtilMsgBr.recommendationsTitle];

  List<IconData> icons = [
    Icons.account_box,
    Icons.account_tree,
    Icons.mail,
    Icons.gite
  ];

  List<Widget> generateRowElements() {
    List items = widget.english ? itemsEg : itemsBr;
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {
          setState(() {
            if (i == 0) {
              widget.scroll.position.moveTo(300, duration: UtilGeneral.duVeloScroll);
            } else if (i == 1) {
              widget.scroll.position.moveTo(600, duration: UtilGeneral.duVeloScroll);
            }
          });
        },
        child: AnimatedCrossFade(
            firstChild: Text(
              items[i],
              style: TextStyle(
                color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey,
              ),
            ),
            secondChild: Text(
              items[i],
              style: TextStyle(
                color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey,
              ),
            ),
            crossFadeState: widget.english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: UtilGeneral.duTrans)
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    List items = widget.english ? itemsEg : itemsBr;
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                icons[pageIndex],
                                color: Colors.blueGrey,
                              ),
                              SizedBox(width: widget.screenSize.width / 20),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    if (pageIndex == 0) {
                                      widget.scroll.position.moveTo(UtilGeneral.sessionAbout, duration: UtilGeneral.duVeloScroll);
                                    } else if (pageIndex == 1) {
                                      widget.scroll.position.moveTo(UtilGeneral.sessionProject, duration: UtilGeneral.duVeloScroll);
                                    }
                                  });
                                },
                                child: AnimatedCrossFade(
                                  firstChild: Text(
                                    items[pageIndex],
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  ),
                                  secondChild: Text(
                                    items[pageIndex],
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  ),
                                  crossFadeState: widget.english ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                  duration: UtilGeneral.duTrans,
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowElements(),
                  ),
                ),
              ),
      ),
    );
  }
}
