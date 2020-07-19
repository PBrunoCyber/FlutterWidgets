import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Learn_1/routes/AppStructureAndNavigation/Sliver/sliverFixedExtentList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'AppBar tutorial';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue[900],
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
      title: _title,
      home: SliverFixedExtentListPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  final List<String> entradas = [
    'Rio de Janeiro',
    'Floriano',
    'Marcos Parente',
    'São Paulo',
    'Jerumenha',
    'Palmas'
  ];
  final List<String> images = [
    'https://midias.agazeta.com.br/2020/06/06/cristo-redentor-no-rio-de-janeiro--258811-article.jpg',
    'https://www.guichevirtual.com.br/image/view2/5689',
    'https://s2.glbimg.com/9Y-Z0epXfWs0CAhEmZ76AE06FSQ=/1080x608/top/smart/s.glbimg.com/jo/g1/f/original/2017/03/12/whatsapp_image_2017-03-12_at_15.00.31.jpeg',
    'https://www.consultoriarr.com.br/wp-content/uploads/2020/01/img-empreender-em-sao-paulo-o-que-voce-precisa-saber-sobre-o-assunto.jpg',
    'https://vermelho.org.br/wp-content/uploads/2019/10/jerumenha31777.jpg',
    'https://s2.glbimg.com/zU13ibXXax0391vZskGH6qhDYe4=/0x0:2000x1125/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2018/l/m/WHRcShRHq7tOmQ8aZphw/44873519715-5406a436e8-o.jpg'
  ];

  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidht = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            title:
                Text('TabBar tutorial', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.blue[50],
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
            titleSpacing: 20,
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
                labelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 12),
                tabs: [
                  Tab(icon: Icon(Icons.add_location), text: 'Location'),
                  Tab(icon: Icon(Icons.add_comment), text: 'Comment'),
                  Tab(icon: Icon(Icons.add_call), text: 'Call'),
                ],
                controller: tabcontroller,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.black,
                isScrollable: false,
                indicatorWeight: 1,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  itemExtent: 120,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: EdgeInsets.only(bottom: 15),
                        shadowColor: Colors.black,
                        elevation: 3,
                        child: ListTile(
                          dense: false,
                          selected: false,
                          enabled: true,
                          title: Text(
                            '${entradas[index]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                              'Hello! This is a simple example of how the list tile works, so i hope you enjoy this widget.'),
                          isThreeLine: true,
                          trailing: Icon(Icons.more_vert),
                          leading: FlutterLogo(
                            size: 80,
                            style: FlutterLogoStyle.markOnly,
                          ),
                          onTap: () {
                            print('${entradas[index]}');
                          },
                          onLongPress: () {
                            print([index]);
                          },
                        ));
                  },
                ),
                Center(
                    child: Text('Comment',
                        style: TextStyle(fontSize: 12))), //PAGE 2
                Center(
                    child:
                        Text('Call', style: TextStyle(fontSize: 12))), //PAGE 3
              ],
              controller: tabcontroller,
              dragStartBehavior: DragStartBehavior.start,
            ),
          ),
        ],
      ),
      drawer: Stack(children: [
        SizedBox(
          width: screenWidht - 10,
          child: Drawer(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                DrawerHeader(
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.black12,
                      foregroundColor: Colors.amber,
                    ),
                    title: Text(
                      'Paulo Bruno',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                    subtitle: Text(
                      'paulo.bf111@gmail.com',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.blue[100]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.black54,
                          ),
                        ),
                        title: Text(
                          'Adicionar Foto',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Divider(
                        height: 40,
                        endIndent: 20,
                        indent: 20,
                      ),
                      ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.add_call,
                            color: Colors.black54,
                          ),
                        ),
                        title: Text(
                          'Adicionar Telefone',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Divider(
                        height: 40,
                        endIndent: 20,
                        indent: 20,
                      ),
                      ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.add_alarm,
                            color: Colors.black54,
                          ),
                        ),
                        title: Text(
                          'Adicionar Alarme',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: screenHeight - 100,
          left: screenWidht / 2 - 30,
          child: CircleAvatar(
              maxRadius: 30,
              foregroundColor: Colors.black,
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ),
      ]),
      drawerEdgeDragWidth: screenWidht - 360,
      drawerDragStartBehavior: DragStartBehavior.down,
    );
  }
}
