import 'package:flutter/material.dart';

class SliverVisibilityPage extends StatefulWidget {
  @override
  _SliverVisibilityState createState() => _SliverVisibilityState();
}

class _SliverVisibilityState extends State<SliverVisibilityPage> {
  bool _visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 200,
            backgroundColor: Colors.blue[900],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverVisibility'),
              centerTitle: true,
            ),
          ),
          SliverVisibility(
            visible: _visibility,
            maintainAnimation: false,
            maintainInteractivity: false,
            maintainState: false,
            maintainSize: false,
            maintainSemantics: false,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 200,
                  color: Colors.blue[100 * (index % 2) + 200],
                );
              }, childCount: 10),
            ),
            replacementSliver: SliverToBoxAdapter(
              child: Container(
                height: 400,
                color: Colors.blue[100],
                child: Center(
                  child: Text(
                    'Oculto!',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    (_visibility) ? _visibility = false : _visibility = true;
                  });
                },
                child: Text('TESTING'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
