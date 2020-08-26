import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FlowPage extends StatefulWidget {
  @override
  _FlowState createState() => _FlowState();
}

class _FlowState extends State<FlowPage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  IconData _currentIcon = Icons.close;
  List<IconData> _icons = [
    Icons.close,
    Icons.access_alarm,
    Icons.notifications,
    Icons.settings,
    Icons.edit
  ];

  void updateIcon(IconData icon) {
    if (icon != Icons.edit) setState(() => _currentIcon = icon);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  Widget _iconItems(IconData icon) {
    return Container(
      margin: EdgeInsets.all(10),
      child: RawMaterialButton(
        fillColor: _currentIcon == icon ? Colors.blue[100] : Colors.grey[400],
        splashColor: Colors.blue[100],
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size(70, 70)),
        onPressed: () {
          updateIcon(icon);
          _animationController.status == AnimationStatus.completed
              ? _animationController.reverse()
              : _animationController.forward();
        },
        child: Icon(icon, color: Colors.white, size: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Flow"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Flow(
          delegate: DelegateFlow(
            menuAnimation: _animationController,
            screenHeight: _screenHeight,
            screenWidth: _screenWidth,
          ),
          children: _icons.map((icon) => _iconItems(icon)).toList(),
        ),
      ),
    );
  }
}

class DelegateFlow extends FlowDelegate {
  final Animation<double> menuAnimation;
  final double screenHeight, screenWidth;
  DelegateFlow(
      {@required this.menuAnimation,
      @required this.screenHeight,
      @required this.screenWidth})
      : super(repaint: menuAnimation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;

    for (var i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i).width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(screenWidth * 0.78 - 10,
            -dx * menuAnimation.value + screenHeight * 0.78, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
