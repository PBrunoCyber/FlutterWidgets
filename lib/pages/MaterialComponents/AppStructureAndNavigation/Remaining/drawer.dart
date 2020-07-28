import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidht = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text('Drawer'),
          centerTitle: true,
        ),
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
    );
  }
}
