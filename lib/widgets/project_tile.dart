import 'package:flutter/material.dart';
import 'package:meu_site/controller/rep_bloc.dart';
import 'package:meu_site/models/repository_list.dart';
import 'package:meu_site/widgets/responsive.dart';


class ProjectTile extends StatefulWidget {
  final Size screenSize;
  var english = true;
  ProjectTile({Key? key, required this.screenSize, required this.english}) : super(key: key);

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {

  final _repController = GetRep();


  @override
  void initState() {
    super.initState();
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
                    builder: (context, snapshot){
                    RepositoryList _repList = RepositoryList.fromJson(snapshot.data);
                    _repList.repList;
                      return snapshot.hasData ? Container(
                        height: 300,
                          child: ListView.builder(
                              itemCount: _repList.repList.length,
                              itemBuilder: (context, i) {
                            return Container(
                              child: Text(_repList.repList[i].name),
                            );
                          })
                      ) : Container(child: CircularProgressIndicator(),);
                    })
              ],
            ),
          ),
        )
    )
        : Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.06,
          left: widget.screenSize.width / 15,
          right: widget.screenSize.width / 15,
        ),
        child: Container(
          child: Card(
            child: Column(
              children: [

              ],
            ),
          ),
        )
    );
  }
}



