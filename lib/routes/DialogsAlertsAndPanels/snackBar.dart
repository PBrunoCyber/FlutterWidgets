import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarState createState() => _SnackBarState();
}

class _SnackBarState extends State<SnackBarPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _key;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _key = GlobalKey<ScaffoldState>();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.bounceInOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Snack Bar"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Show Snack Bar"),
          onPressed: () => _showSnackBar(context),
        ),
      ),
    );
  }

  _showSnackBar(BuildContext context) {
    return _key.currentState.showSnackBar(
      SnackBar(
        duration: Duration(minutes: 1),
        content: Container(
          child: Text("Aceitar termos de compromisso?"),
        ),
        backgroundColor: Colors.grey,
        elevation: 30,
        animation: _animation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        behavior: SnackBarBehavior.fixed,
        onVisible: () => print("Aberto!"),
        action: SnackBarAction(
          label: "Voltar",
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
