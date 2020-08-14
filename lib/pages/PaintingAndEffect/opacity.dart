import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OpacityPage extends StatefulWidget {
  @override
  _OpacityState createState() => _OpacityState();
}

class _OpacityState extends State<OpacityPage> {
  bool _isActive = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Opacity"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: _isActive ? 1.0 : 0.0,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child:
                    Container(height: 200, width: 200, color: Colors.blue[900]),
              ),
            ),
            CupertinoButton.filled(
              child: Text("Show/Hide"),
              onPressed: () => setState(() => _isActive = !_isActive),
            )
          ],
        ),
      ),
    );
  }
}
