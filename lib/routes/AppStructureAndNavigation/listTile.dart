import 'package:flutter/material.dart';

class ListTilePage extends StatefulWidget {
  @override
  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<ListTilePage>
    with SingleTickerProviderStateMixin {
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
                ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  itemExtent: 120,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: EdgeInsets.only(bottom: 15),
                        color: Colors.red[50],
                        shadowColor: Colors.black,
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
            ),
          ),
        ],
      ),
    );
  }
}
