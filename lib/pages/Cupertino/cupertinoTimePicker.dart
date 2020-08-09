import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTimePickerPage extends StatefulWidget {
  @override
  _CupertinoTimePickerState createState() => _CupertinoTimePickerState();
}

class _CupertinoTimePickerState extends State<CupertinoTimePickerPage> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  void _showTimePicker(BuildContext context) async {
    var time = await showCupertinoModalPopup(
      context: context,
      builder: (context) => TimePicker(),
    );
    setState(
      () => _duration = time == null ? Duration(hours: 0, minutes: 0) : time,
    );
  }

  String format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text("Cupertino Time Picker"),
          backgroundColor: Colors.grey.shade200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              child: Text("Show Cupertino Time Picker"),
              onPressed: () => _showTimePicker(context),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(format(_duration),
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ],
        ),
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker>
    with SingleTickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation<Offset> _animation;
  Duration _time;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            onVerticalDragDown: (details) {
              _controller.forward();
              Future.delayed(Duration(milliseconds: 600), () {
                Navigator.of(context).pop(_time);
                _controller.reverse();
              });
            },
          ),
        ),
        Expanded(
          child: SlideTransition(
            position: _animation,
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
              ),
              child: CupertinoTimerPicker(
                onTimerDurationChanged: (value) {
                  setState(() => _time = value);
                },
                backgroundColor: Colors.transparent,
                mode: CupertinoTimerPickerMode.hm,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
