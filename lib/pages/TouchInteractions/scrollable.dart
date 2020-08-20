import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ScrollablePage extends StatefulWidget {
  @override
  _ScrollableState createState() => _ScrollableState();
}

class _ScrollableState extends State<ScrollablePage> {
  final _listNames = List<String>.generate(20, (index) => "Name ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Scrollable"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _listNames.length,
          itemBuilder: (context, index) {
            return Scrollable(
              viewportBuilder: (context, position) {
                return Card(
                  child: ListTile(
                    title: Text(
                      _listNames[index],
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
