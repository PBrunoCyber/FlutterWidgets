import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//HomePage
class CupertinoTabViewPage extends StatefulWidget {
  @override
  _CupertinoTabViewState createState() => _CupertinoTabViewState();
}

class _CupertinoTabViewState extends State<CupertinoTabViewPage> {
  //Variables
  int _index = 0;
  static Widget _bodies(BuildContext context, String buttonName, String route) {
    return Center(
      child: CupertinoButton(
        child: Text(buttonName, style: Theme.of(context).textTheme.bodyText2),
        onPressed: () => Navigator.of(context).pushNamed(route),
        color: Colors.grey.shade300,
      ),
    );
  }

  List<Widget> _listBodies(BuildContext context) {
    List<Widget> _itens = [
      _bodies(context, "Home Next", "/homenext"),
      _bodies(context, "Search Next", "/searchnext"),
      _bodies(context, "Configuration Next", "/configurationnext"),
    ];
    return _itens;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
        activeColor: Colors.black,
        backgroundColor: Colors.grey.shade200,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Seach")),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_low), title: Text("Configuration")),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          routes: {
            "/homenext": (context) => HomeNext(),
            "/searchnext": (context) => SearchNext(),
            "/configurationnext": (context) => ConfigurationNext(),
          },
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Colors.grey.shade200,
                middle: Text("Cupertino Tab View"),
              ),
              child: _listBodies(context)[_index],
            );
          },
        );
      },
    );
  }
}

//Seconds Pages
class HomeNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home Next Page"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Container(),
    );
  }
}

class SearchNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Search Next Page"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Container(),
    );
  }
}

class ConfigurationNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey.shade200,
        middle: Text("Configuration Next Page"),
      ),
      child: Container(),
    );
  }
}
