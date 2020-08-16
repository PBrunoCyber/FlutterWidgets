import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Matrix4Page extends StatefulWidget {
  @override
  _Matrix4State createState() => _Matrix4State();
}

class _Matrix4State extends State<Matrix4Page> {
  double x = 0;
  double y = 0;
  double z = 0.002;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Matrix4"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Center(
        child: Transform(
          transform: Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, z, 0, 0, 0, 1)
            ..rotateX(x)
            ..rotateY(y)
            ..rotateZ(z),
          //Rotate no eixo x
          /*Matrix4( 
              1,0,0,0,
              0, math.cos(x), math.sin(x),0,
              0,-nath.sin(x), math.cos(x),0,
              0,0,0,1
          ),*/
          //Rotate no eixo y
          /*Matrix4(
              math.cos(x),0,-math.sin(x),0,
              0,1,0,0
              math.sin(x),0,math.cos(x),0,
              0,0,0,1
          ),*/
          //Rotate no eixo z
          /*Matrix4( 
            math.cos,math.sin(x),0,0,
            -math.sin,math.cos(x),0,0,
            0,0,1,0,
            0,0,0,1
          ),*/
          alignment: Alignment.center,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                x = x + details.delta.dy / 100;
                y = y + details.delta.dx / 100;
              });
            },
            child: Container(
              color: Colors.red,
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}
