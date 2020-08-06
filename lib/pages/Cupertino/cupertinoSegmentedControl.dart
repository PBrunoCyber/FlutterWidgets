import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControlPage extends StatefulWidget {
  @override
  _CupertinoSegmentedControlState createState() =>
      _CupertinoSegmentedControlState();
}

class _CupertinoSegmentedControlState
    extends State<CupertinoSegmentedControlPage> with TickerProviderStateMixin {
  //Variables
  AnimationController _controller;
  Animation<Offset> _animation;
  int _selected = 0;

  static TextStyle _style = TextStyle(
    fontSize: 14,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
    fontFamily: "Arial",
  );

  final Map<int, Widget> _segments = <int, Widget>{
    0: Text("Home", style: _style),
    1: Text("Search Page", style: _style),
    2: Text(" Configuration ", style: _style)
  };

  static Widget _pages(Icon _icon, List<String> mens) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 100),
          child: Image.network(
            mens[0],
            height: 200,
            width: 200,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CircularProgressIndicator(
                value: loadingProgress != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _icon,
            Text(mens[1],
                style: TextStyle(
                    inherit: false, color: Colors.black, fontSize: 20)),
          ],
        )
      ],
    );
  }

  List<Widget> _bodies = [
    _pages(Icon(Icons.home), [
      "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png",
      "HomePage"
    ]),
    _pages(
      Icon(Icons.search),
      ["https://img.icons8.com/cotton/2x/search.png", "SearchPage"],
    ),
    _pages(
      Icon(Icons.brightness_low),
      [
        "https://lh3.googleusercontent.com/proxy/_jHcgCOWUuou8c66X59E4jKkT5XlSafGDbx8rI0ae_I7gTAk5HgV9X8ZF46UVPqmzdjC_phacRXADmuk95ofHtMuc5am1VLyn-Lj7W6A_k-2",
        "Configuration"
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey.shade200,
        middle: Text("Cupertino Segmented Control"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: CupertinoSegmentedControl(
                  groupValue: _selected,
                  children: _segments,
                  onValueChanged: (value) {
                    _controller.forward();
                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() {
                        this._selected = value;
                      });
                      _controller.reverse();
                    });
                  },
                  selectedColor: Colors.black45,
                  borderColor: Colors.black45,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 14,
            child: SlideTransition(
              position: _animation,
              child: Center(
                child: Container(
                  child: _bodies[_selected],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    super.initState();
  }
}
