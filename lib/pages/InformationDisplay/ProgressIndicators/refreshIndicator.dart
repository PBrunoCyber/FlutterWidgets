import 'package:flutter/material.dart';

class RefreshIndicatorPage extends StatefulWidget {
  @override
  _RefreshIndicatorState createState() => _RefreshIndicatorState();
}

class _RefreshIndicatorState extends State<RefreshIndicatorPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text("RefreshIndicator"),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: RefreshIndicator(
        child: ListView(
          children: _itens(),
          physics: BouncingScrollPhysics(),
        ),
        onRefresh: _handleRefresh,
        backgroundColor: Colors.white,
        color: Colors.indigo[900],
        strokeWidth: 5,
        displacement: 50,
        semanticsLabel: "RefreshIndicator",
        semanticsValue: "refresh",
      ),
    );
  }

  List<Widget> _itens() {
    var items = <Widget>[];
    for (int i = _index; i < _index + 90; i++) {
      var item = Column(
        children: <Widget>[
          ListTile(
            title: Text("Indíce: $i"),
          ),
          Divider(
            height: 2.0,
          ),
        ],
      );
      items.add(item);
    }
    return items;
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 900));

    setState(() {
      _index += 10;
    });
    return null;
  }
}
