import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  BottomSheetState createState() => BottomSheetState();
}

class BottomSheetState extends State<BottomSheetPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
          title: Text("Bottom Sheet"),
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
            BotaoSheet()
          ],
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {
            print("Fechado!");
          },
          elevation: 10,
          animationController: _controller,
          clipBehavior: Clip.antiAlias,
          enableDrag: false,
          backgroundColor: Colors.indigo[50],
          onDragEnd: (details, {isClosing}) => print("Cu²"),
          onDragStart: (details) => print("Cu"),
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

class BotaoSheet extends StatefulWidget {
  @override
  _BotaoSheetState createState() => _BotaoSheetState();
}

class _BotaoSheetState extends State<BotaoSheet> {
  BottomSheetState a = BottomSheetState();
  bool isActive = false;
  String text = "Mostrar";

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        if (isActive) {
          Navigator.of(context).pop();
          setState(() {
            isActive = false;
            text = "Mostrar";
          });
        } else {
          setState(
            () {
              isActive = true;
              text = "Fechar";
            },
          );
          var close = a.bottomSheet(context);
          close.closed.then((values) {
            setState(() {
              isActive = false;
              text = "Mostrar";
            });
          });
        }
        return null;
      },
    );
  }
}
