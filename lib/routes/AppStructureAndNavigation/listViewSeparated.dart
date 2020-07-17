import 'package:flutter/material.dart';

class ListViewSeparatedPage extends StatefulWidget {
  @override
  _ListViewSeparatedState createState() => _ListViewSeparatedState();
}

class _ListViewSeparatedState extends State<ListViewSeparatedPage>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<String> entradas = [
    "São Paulo",
    "Floriano",
    "Marcos Parente",
    "São João dos Patos",
    "Rio de Janeiro",
    "Palmas"
  ];
  List<String> images = [
    "https://static.cdn.pleno.news/2019/09/plenonews_69429078_424547198412357_2917137491588994799_n-1024x684.jpg",
    "https://static.cdn.pleno.news/2019/09/plenonews_69429078_424547198412357_2917137491588994799_n-1024x684.jpg",
    "https://static.cdn.pleno.news/2019/09/plenonews_69429078_424547198412357_2917137491588994799_n-1024x684.jpg",
    "https://static.cdn.pleno.news/2019/09/plenonews_69429078_424547198412357_2917137491588994799_n-1024x684.jpg",
    "https://static.cdn.pleno.news/2019/09/plenonews_69429078_424547198412357_2917137491588994799_n-1024x684.jpg",
    "https://static.cdn.pleno.news/2019/09/plenonews_69429078_424547198412357_2917137491588994799_n-1024x684.jpg"
  ];

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
                ListView.separated(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.black))),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            '${entradas[index]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                '${images[index]}',
                                height: 600.0,
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
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
