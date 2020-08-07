import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabBarScaffoldPage extends StatefulWidget {
  @override
  _CupertinoTabBarScaffoldState createState() =>
      _CupertinoTabBarScaffoldState();
}

class _CupertinoTabBarScaffoldState extends State<CupertinoTabBarScaffoldPage>
    with SingleTickerProviderStateMixin {
  //Variables
  int _currentIndex = 0;
  TextStyle _style = TextStyle(
      decoration: TextDecoration.none, fontFamily: "Arial", fontSize: 12);

  static Widget _bodies(String title, String image) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            image,
            height: 200,
            width: 200,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null)
                return CupertinoActivityIndicator();
              else
                return child;
            },
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: "Arial",
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _listBodies = [
    _bodies("Home",
        "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
    _bodies("Search Page", "https://img.icons8.com/cotton/2x/search.png"),
    _bodies("Configuration",
        "https://icons.iconarchive.com/icons/grafikartes/flat-retro-modern/512/settings-icon.png")
  ];

  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
        .animate(CurvedAnimation(curve: Curves.ease, parent: _controller));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.grey.shade200,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        border:
            Border.fromBorderSide(BorderSide(color: Colors.black, width: 0)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home", style: _style),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search", style: _style),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_low),
            title: Text("Configuration", style: _style),
          ),
        ],
        onTap: (value) {
          _controller.forward();
          Future.delayed(Duration(milliseconds: 300), () {
            setState(() => _currentIndex = value);
            _controller.reverse();
          });
        },
        currentIndex: _currentIndex,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Colors.grey.shade200,
                middle: Text('Cupertino Tab Bar Scaffold'),
              ),
              child: SlideTransition(
                position: _animation,
                child: index == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _listBodies[_currentIndex],
                          SizedBox(height: 20),
                          CupertinoButton(
                            child: Text("Next Page"),
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return CupertinoPageScaffold(
                                      child: Container(),
                                      navigationBar: CupertinoNavigationBar(
                                        backgroundColor: Colors.grey.shade200,
                                        middle: Text("Page 2 Home"),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : _listBodies[_currentIndex],
              ),
            );
          },
        );
      },
    );
  }
}
