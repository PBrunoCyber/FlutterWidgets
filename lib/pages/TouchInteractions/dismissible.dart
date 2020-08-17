import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DismissiblePage extends StatefulWidget {
  DismissiblePage({Key key}) : super(key: key);
  @override
  _DismissibleState createState() => _DismissibleState();
}

class _DismissibleState extends State<DismissiblePage> {
  final items = List<String>.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Dismissible"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              onDismissed: (direction) {
                print("" + item + " removed!");
                setState(() => items.removeAt(index));
              },
              key: Key(item),
              background: Container(
                child: Center(
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                color: Colors.red[200],
              ),
              child: ListTile(
                trailing: Icon(Icons.delete, color: Colors.grey.shade500),
                title: Text("Remove " + item),
              ),
            );
          },
        ),
      ),
    );
  }
}
