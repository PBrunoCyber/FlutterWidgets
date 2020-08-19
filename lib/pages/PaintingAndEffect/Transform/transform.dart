import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TransformPage extends StatefulWidget {
  @override
  _TransformState createState() => _TransformState();
}

class _TransformState extends State<TransformPage>
    with TickerProviderStateMixin {
  //Variables
  AnimationController _animationController;
  List<Color> _color = [Colors.red, Colors.blue, Colors.indigo, Colors.green];
  List<Animation> _rotate = List<Animation>(4),
      _sizeWidth = List<Animation>(4),
      _sizeHeight = List<Animation>(4);
  Animation _curve;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curve = CurvedAnimation(parent: _animationController, curve: Curves.ease);
    for (int i = 0; i < 4; i++) {
      _sizeWidth[i] = Tween<double>(begin: 0, end: 120).animate(_curve);
      _sizeHeight[i] = Tween<double>(begin: 0, end: 120).animate(_curve);
      _rotate[i] = Tween<double>(begin: 0, end: 2.35).animate(_curve);
    }
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Testing"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Transform(
                transform:
                    Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 220, 0, 1)
                      ..rotateZ(_rotate[index].value),
                child: Container(
                  width: _sizeWidth[index].value,
                  height: _sizeHeight[index].value,
                  color: _color[index],
                  child: CupertinoButton.filled(
                      child: Text(""), onPressed: () => print(index)),
                ),
                alignment: Alignment.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
