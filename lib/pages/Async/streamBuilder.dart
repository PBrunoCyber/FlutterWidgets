import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderState createState() => _StreamBuilderState();
}

class _StreamBuilderState extends State<StreamBuilderPage> {
  Stream<int> _stream = (() async* {
    await Future.delayed(Duration(seconds: 1));
    yield 1;
    await Future.delayed(Duration(seconds: 2));
  })();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Stream Builder"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            List<Widget> _children;
            if (snapshot.hasError) {
              _children = [
                Icon(
                  Icons.close,
                  size: 90,
                  color: Colors.red,
                ),
                Text(
                  "Houve algum erro!",
                  style: Theme.of(context).textTheme.headline6,
                )
              ];
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  _children = <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 90,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        'Select a lot',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  ];
                  break;
                case ConnectionState.waiting:
                  _children = [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Awaiting results... ",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          CupertinoActivityIndicator()
                        ],
                      ),
                    )
                  ];
                  break;
                case ConnectionState.active:
                  _children = <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Result: " + snapshot.data.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  ];
                  break;
                case ConnectionState.done:
                  _children = <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        '${snapshot.data} (closed)',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  ];
                  break;
              }
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
