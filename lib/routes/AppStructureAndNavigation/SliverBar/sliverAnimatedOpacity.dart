import 'package:flutter/material.dart';

class SliverAnimatedOpacityPage extends StatefulWidget {
  SliverAnimatedOpacityPage({Key key}) : super(key: key);

  @override
  _SliverAnimatedOpacityState createState() => _SliverAnimatedOpacityState();
}

class _SliverAnimatedOpacityState extends State<SliverAnimatedOpacityPage>
    with SingleTickerProviderStateMixin {
  bool _visible = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 200,
            pinned: true,
            floating: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAnimatedOpacity'),
              background: Image.network(
                'https://img.ibxk.com.br/2019/07/26/26000403908396.jpg?w=328',
                fit: BoxFit.fill,
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverAnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            onEnd: () {
              print(_visible ? "Achôo" : "Sumiu");
            },
            alwaysIncludeSemantics: false,
            sliver: SliverFixedExtentList(
              itemExtent: 100,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    color: Colors.indigo[100 * (index % 6) + 100],
                  );
                },
                childCount: 7,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              tooltip: "Toogle Opacity",
              child: Icon(Icons.flip),
            ),
          )
        ],
      ),
    );
  }
}
