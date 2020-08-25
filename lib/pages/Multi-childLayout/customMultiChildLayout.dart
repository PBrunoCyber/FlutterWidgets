import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomMultiChildLayoutPage extends StatefulWidget {
  @override
  _CustomMultiChildLayoutState createState() => _CustomMultiChildLayoutState();
}

class _CustomMultiChildLayoutState extends State<CustomMultiChildLayoutPage> {
  List<Offset> _offset;
  List<BoxConstraints> constraints = [
    for (var i = 0; i < 4; i++)
      BoxConstraints(maxHeight: 150, maxWidth: 150, minHeight: 0, minWidth: 150)
  ];

  @override
  Widget build(BuildContext context) {
    _offset = [
      Offset(
        MediaQuery.of(context).size.width / 3 - 12.5,
        MediaQuery.of(context).size.height / 5 - 3,
      ),
      Offset(
        25,
        MediaQuery.of(context).size.height / 3,
      ),
      Offset(
        MediaQuery.of(context).size.width / 1.75,
        MediaQuery.of(context).size.height / 3 - 12,
      ),
      Offset(
        MediaQuery.of(context).size.width / 3 - 1,
        MediaQuery.of(context).size.height / 2 - 36,
      ),
    ];
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Custom Multi Child Layout"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: CustomMultiChildLayout(
          delegate:
              MultiChildDelegate(offset: _offset, constraints: constraints),
          children: [
            LayoutId(
              id: 0,
              child: GestureDetector(
                onTap: () => print(0),
                child: Transform.rotate(
                  alignment: Alignment.center,
                  angle: 2.3,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            LayoutId(
              id: 1,
              child: GestureDetector(
                onTap: () => print(1),
                child: Transform.rotate(
                  alignment: Alignment.center,
                  angle: 2.3,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            LayoutId(
              id: 2,
              child: GestureDetector(
                onTap: () => print(2),
                child: Transform.rotate(
                  alignment: Alignment.center,
                  angle: 2.3,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            LayoutId(
              id: 3,
              child: GestureDetector(
                onTap: () => print(3),
                child: Transform.rotate(
                  alignment: Alignment.center,
                  angle: 2.3,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiChildDelegate extends MultiChildLayoutDelegate {
  final List<Offset> offset;
  final List<BoxConstraints> constraints;
  MultiChildDelegate({@required this.offset, @required this.constraints});

  @override
  void performLayout(Size size) {
    for (var i = 0; i < 4; i++) {
      if (hasChild(i)) {
        layoutChild(i, constraints[i]);
        positionChild(i, offset[i]);
      }
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
