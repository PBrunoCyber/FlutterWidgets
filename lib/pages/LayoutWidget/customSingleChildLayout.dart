import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomSingleChildLayoutPage extends StatefulWidget {
  @override
  _CustomSingleChildLayoutState createState() =>
      _CustomSingleChildLayoutState();
}

class _CustomSingleChildLayoutState extends State<CustomSingleChildLayoutPage> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Custom Single Child Layout"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: CustomSingleChildLayout(
        delegate: Delegate(
          offset: Offset(_screenWidth / 8, _screenHeight / 2),
        ),
        child: GestureDetector(
          onTap: () => print("Ok"),
          child: Container(
            constraints: BoxConstraints(maxHeight: 200, maxWidth: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
          ),
        ),
      ),
    );
  }
}

class Delegate extends SingleChildLayoutDelegate {
  final Offset offset;
  Delegate({@required this.offset});

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return offset;
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
