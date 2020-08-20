import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorState createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorPage> {
  double _scale = 0.5;
  double _previousScale = 0.0;
  Offset offset = Offset(0.0, 0.0);
  Offset _previousOffset = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Gesture Detector"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: _drag(),
      ),
    );
  }

  Widget _drag() {
    return GestureDetector(
      onScaleStart: (details) {
        _previousScale = _scale;
        _previousOffset = details.localFocalPoint;
      },
      onScaleUpdate: (details) {
        setState(() {
          this._scale = _previousScale * details.scale;
          this.offset = details.localFocalPoint - _previousOffset;
        });
      },
      onScaleEnd: (details) {
        setState(() {
          this._scale = 0.5;
          this.offset = Offset(0.0, 0.0);
        });
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4(_scale, 0, 0, 0, 0, _scale, 0, 0, 0, 0, _scale, 0,
            offset.dx, offset.dy, 0, 1),
        child: Container(
          child: Image.asset(
            'lib/assets/coruja.jpg',
          ),
        ),
      ),
    );
  }
}
