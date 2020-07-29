import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleState createState() =>
      _AnimatedDefaultTextStyleState();
}

class _AnimatedDefaultTextStyleState
    extends State<AnimatedDefaultTextStylePage> {
  bool _change = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Animated Text Style"),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedDefaultTextStyle(
                child: _change
                    ? Center(child: Text("Fonte alterada"))
                    : Text("Mudar fonte"),
                style: _change
                    ? TextStyle(
                        fontSize: 40,
                        color: Colors.indigo[600],
                        fontWeight: FontWeight.bold,
                      )
                    : TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                duration: Duration(seconds: 2),
                curve: Curves.elasticOut,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(),
                textWidthBasis: TextWidthBasis.longestLine,
                maxLines: 100,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: OutlineButton(
                    onPressed: () {
                      setState(() {
                        this._change = !_change;
                      });
                    },
                    splashColor: Colors.indigo[500],
                    borderSide: BorderSide(color: Colors.black),
                    child: Text(
                      "Mudar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
