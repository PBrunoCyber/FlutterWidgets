import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlaceHolderPage extends StatefulWidget {
  @override
  _PlaceHolderState createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolderPage> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Place Holder"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(
                fallbackHeight: 80,
                fallbackWidth: _screenWidth,
                color: Colors.red,
              ),
              SizedBox(
                height: 50,
              ),
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: _screenWidth / 2,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
