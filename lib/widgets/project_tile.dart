import 'package:flutter/material.dart';
import 'package:meu_site/controller/rep_bloc.dart';
import 'package:meu_site/models/repository_list.dart';
import 'package:meu_site/models/repository_model.dart';
import 'package:meu_site/util/util_general.dart';
import 'package:meu_site/util/util_msg_br.dart';
import 'package:meu_site/util/util_msg_eg.dart';
import 'package:meu_site/widgets/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatefulWidget {
  final Size screenSize;
  var english = true;

  ProjectTile({Key? key, required this.screenSize, required this.english})
      : super(key: key);

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  final _repController = GetRep();

  @override
  void initState() {
    super.initState();
  }

  Widget cardProjects(RepositoryModel rep) {
    return Container(
      height: 50,
      width: 300,
      child: Card(
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      child: Image.asset('assets/images/logogithub.png'),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        rep.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      rep.description ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[900],
                      onSurface: Colors.green,
                      elevation: 20,
                      shadowColor: Colors.black,
                    ),
                    child: UtilGeneral().animatedCha(UtilMsgEg.viewProject,
                        UtilMsgBr.viewProject, widget.english, TextStyle()),
                    onPressed: () async {
                      final Uri _url = Uri.parse(rep.url);
                      if (!await launchUrl(_url)) throw 'Could not launch ${_url}';
                    },
                  ),
                )),
            Divider(),
            Expanded(
              flex: 1,
              child: Container(
                child: UtilGeneral().animatedCha(
                  "${UtilMsgEg.lastUpdate} ${UtilGeneral().convertDate(rep.updatedAt)}",
                  "${UtilMsgBr.lastUpdate} ${UtilGeneral().convertDate(rep.updatedAt)}",
                  widget.english,
                  TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: widget.screenSize.height / 50),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 20,
                child: Column(
                  children: [
                    StreamBuilder(
                        initialData: _repController.getReps(),
                        stream: _repController.out,
                        builder: (context, snapshot) {
                          RepositoryList _repList =
                              RepositoryList.fromJson(snapshot.data);
                          _repList.repList;
                          if (snapshot.hasError) {
                            return LinearProgressIndicator();
                          } else if (snapshot.hasData) {
                            return Container(
                                height: 300,
                                child: Scrollbar(
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: _repList.repList.length,
                                      itemBuilder: (context, i) {
                                        return cardProjects(
                                            _repList.repList[i]);
                                      }),
                                ));
                          } else {
                            return CircularProgressIndicator();
                          }
                        })
                  ],
                ),
              ),
            ))
        : Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.06,
              left: widget.screenSize.width / 15,
              right: widget.screenSize.width / 15,
            ),
            child: Container(
              child: Card(
                child: Column(
                  children: [],
                ),
              ),
            ));
  }
}
