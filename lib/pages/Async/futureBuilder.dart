import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderState createState() => _FutureBuilderState();
}

class _FutureBuilderState extends State<FutureBuilderPage> {
  Future<String> _delayed =
      Future<String>.delayed(Duration(seconds: 2), () => "Data loaded");

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Future Builder"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: FutureBuilder(
          future: _delayed,
          builder: (context, snapshot) {
            List<Widget> _children;
            if (snapshot.hasData) {
              _children = [
                Icon(Icons.check_circle_outline, size: 90, color: Colors.green),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    snapshot.data,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ];
            } else {
              _children = [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Awaiting results... ",
                          style: Theme.of(context).textTheme.headline6),
                      CupertinoActivityIndicator()
                    ],
                  ),
                )
              ];
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _children,
            );
          },
        ),
      ),
    );
  }
}
