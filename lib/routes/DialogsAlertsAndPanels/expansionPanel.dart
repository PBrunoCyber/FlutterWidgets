import 'package:flutter/material.dart';

class ExpansionPanelPage extends StatefulWidget {
  @override
  _ExpansionPanelState createState() => _ExpansionPanelState();
}

class _ExpansionPanelState extends State<ExpansionPanelPage> {
  bool isExpand = false;
  @override
  void initState() {
    isExpand = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Expansion Panel"),
          centerTitle: true,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ExpansionPanelList(
            animationDuration: Duration(seconds: 1),
            expandedHeaderPadding: EdgeInsets.all(0),
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                isExpand = !isExpand;
              });
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  if (isExpand) {
                    return Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "A BOLA É REDONDA!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(top: 15, left: 10),
                      child: Text(
                        "A BOLA É REDONDA, APRENDA MAIS!",
                      ),
                    );
                  }
                },
                isExpanded: isExpand,
                body: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      "Ullamco consectetur nulla veniam reprehenderit ad velit minim pariatur eiusmod qui est commodo commodo. Amet cupidatat dolor ut laboris reprehenderit cillum nulla proident. Sint voluptate enim quis nostrud in fugiat ipsum consequat sint deserunt non cupidatat. Dolor enim cillum ad nostrud anim fugiat dolore do ut duis fugiat tempor consectetur. Amet aliqua ex irure consectetur ut et. Veniam nostrud exercitation ea ut qui dolor Lorem non culpa eu proident deserunt. Sit sit dolor sit aliqua nostrud ad enim aliquip magna."),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
