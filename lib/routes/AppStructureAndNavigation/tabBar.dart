import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBarPage>
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
                Center(child: Text('Location', style: TextStyle(fontSize: 12))),
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
