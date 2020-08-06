import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//DropDown para IOS

class CupertinoPickerPage extends StatefulWidget {
  @override
  _CupertinoPickerState createState() => _CupertinoPickerState();
}

class _CupertinoPickerState extends State<CupertinoPickerPage> {
  String _selected = "";

  void _showCupertinoPicker(BuildContext context) async {
    var request = await showDialog(
      context: context,
      builder: (context) => PickerCupertino(),
    );
    setState(() => _selected = request == null ? "" : request);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Picker"),
        backgroundColor: Colors.grey.shade100,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton.filled(
              child: Text("Show Cupertino Picker"),
              onPressed: () => _showCupertinoPicker(context),
            ),
            Divider(
              color: Colors.transparent,
              height: 30,
            ),
            Text(_selected, style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
      ),
    );
  }
}

class PickerCupertino extends StatefulWidget {
  @override
  _PickerCupertinoState createState() => _PickerCupertinoState();
}

class _PickerCupertinoState extends State<PickerCupertino>
    with TickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation<Offset> _animation;

  static List<String> _cities = [
    "San Francisco",
    "New York",
    "Texas",
    "California",
    "Miami",
    "Los Angeles",
    "Boston",
    "Washington D.C",
    "Chicago",
    "Orlando",
    "Seattle",
    "San Diego"
  ];
  String _select = _cities[0];

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = _animation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              onVerticalDragDown: (details) {
                setState(() {
                  _animation =
                      Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
                          .animate(
                    CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                  );
                });
                _controller.forward();
                Future.delayed(Duration(milliseconds: 300), () {
                  Navigator.pop(context, _select);
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)))),
              child: CupertinoPicker.builder(
                scrollController: FixedExtentScrollController(initialItem: 6),
                itemExtent: 25,
                onSelectedItemChanged: (value) {
                  setState(() => _select = _cities[value]);
                },
                childCount: _cities.length,
                itemBuilder: (context, index) {
                  return Text(_cities[index]);
                },
                squeeze: 1,
                useMagnifier: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
