import 'package:flutter/material.dart';

class BottomModalSheetPage extends StatefulWidget {
  @override
  BottomModalSheetState createState() => BottomModalSheetState();
}

class BottomModalSheetState extends State<BottomModalSheetPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  bool isActive = false;
  String text = "Mostrar";
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _key = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Modal Bottom Sheet"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Mostrar Bottom Sheet',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Divider(
              endIndent: 60,
              indent: 60,
            ),
            RaisedButton(
              child: Text("Mostrar"),
              onPressed: () {
                bottomModalSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  bottomModalSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.indigo[100]),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      barrierColor: Colors.black26,
      clipBehavior: Clip.antiAlias,
      enableDrag: false,
      isDismissible: true,
      isScrollControlled: true,
      useRootNavigator: false,
      elevation: 12,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          enableDrag: true,
          backgroundColor: Colors.indigo[50],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.indigo[100]),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          builder: (context) => Wrap(
            children: <Widget>[
              ListTile(
                title: Text("First Option"),
                leading: Icon(Icons.looks_one),
                contentPadding: EdgeInsets.only(top: 10, left: 20),
              ),
              ListTile(
                title: Text("Second Option"),
                leading: Icon(Icons.looks_two),
                contentPadding: EdgeInsets.only(top: 10, left: 20),
              ),
              ListTile(
                title: Text("Third Option"),
                leading: Icon(Icons.looks_3),
                contentPadding: EdgeInsets.only(top: 10, left: 20),
              ),
            ],
          ),
        );
      },
    );
  }
}
