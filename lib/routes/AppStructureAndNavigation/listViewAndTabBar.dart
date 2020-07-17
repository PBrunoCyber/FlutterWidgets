import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewPage>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            title:
                Text('TabBar tutorial', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_alert),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () {},
              )
            ],
            actionsIconTheme: IconThemeData(color: Colors.black),
            centerTitle: false,
            elevation: 0.0,
            titleSpacing: 0.0,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            iconTheme: IconThemeData(color: Colors.black),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
            ),
          )),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.red,
                labelStyle: TextStyle(fontSize: 12),
                tabs: [
                  Tab(icon: Icon(Icons.add_location), text: 'Location'),
                  Tab(icon: Icon(Icons.add_comment), text: 'Comment'),
                  Tab(icon: Icon(Icons.add_call), text: 'Call'),
                ],
                controller: tabcontroller,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.red,
                isScrollable: false,
                indicatorWeight: 1,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  padding: EdgeInsets.all(10),
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: false,
                  physics: AlwaysScrollableScrollPhysics(),
                  cacheExtent: 100.0,
                  shrinkWrap: true,
                  primary: false,
                  semanticChildCount: 3,
                  itemExtent: 200,
                  addRepaintBoundaries: true,
                  addSemanticIndexes: true,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: <Widget>[
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12))),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            "This is a very \nbeatiful image",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black26,
                            ),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                'https://s2.glbimg.com/nneRZbNOjAtkVvZMIvvNyB8Zp5I=/0x0:825x464/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/P/b/DdysbzQnS0IwDl8QlkUA/planeta.jpg',
                                height: 600.0,
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Text('Comment',
                        style: TextStyle(fontSize: 12))), //PAGE 2
                Center(
                    child:
                        Text('Call', style: TextStyle(fontSize: 12))), //PAGE 3
              ],
              controller: tabcontroller,
            ),
          ),
        ],
      ),
    );
  }
}
