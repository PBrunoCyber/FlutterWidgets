import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LongPressDraggablePage extends StatefulWidget {
  @override
  _LongPressDraggableState createState() => _LongPressDraggableState();
}

class _LongPressDraggableState extends State<LongPressDraggablePage> {
  bool _isDrag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Long Press Draggable"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: LongPressDraggable(
          child: !_isDrag
              ? Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                )
              : Container(),
          feedback: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
          ),
          onDragStarted: () => setState(() => _isDrag = true),
          onDraggableCanceled: (v, o) => setState(() => _isDrag = false),
        ),
      ),
    );
  }
}
