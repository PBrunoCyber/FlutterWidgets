import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class SliverBarPage extends StatefulWidget {
  @override
  _SliverBarState createState() => _SliverBarState();
}

class _SliverBarState extends State<SliverBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ],
            actionsIconTheme:
                IconThemeData(color: Colors.white, size: 30, opacity: 1),
            automaticallyImplyLeading: true,
            backgroundColor: Colors.indigo[900],
            bottom: null,
            brightness: Brightness.dark,
            centerTitle: true,
            elevation: 20,
            excludeHeaderSemantics: false,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Available seats'),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              titlePadding: EdgeInsets.all(20),
              background: Image.network(
                'https://img.ibxk.com.br/2019/07/26/26000403908396.jpg?w=328',
                fit: BoxFit.fill,
              ),
            ),
            floating: false,
            forceElevated: true,
            iconTheme: IconThemeData(color: Colors.white),
            leading: Icon(Icons.menu),
            onStretchTrigger: null,
            pinned: true,
            primary: true,
            shape: ContinuousRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(5))),
            snap: false,
            stretch: false,
            stretchTriggerOffset: 1,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: MediaQuery.of(context).size.height - 60,
                child: Text("Testing Sliver List"),
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Colors.indigo[100 * (index % 9)]),
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
