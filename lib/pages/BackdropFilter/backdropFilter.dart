import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BackdropFilterPage extends StatefulWidget {
  @override
  _BackdropFilterState createState() => _BackdropFilterState();
}

class _BackdropFilterState extends State<BackdropFilterPage> {
  double _blur = 5.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Backdrop Filter"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(
                  'https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png',
                ),
                Positioned(
                  child: Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
                        child: Container(
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CupertinoButton.filled(
                  child: Text("To see"),
                  onPressed: () => setState(
                    () => _blur == 0 ? this._blur = 5 : this._blur = 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
