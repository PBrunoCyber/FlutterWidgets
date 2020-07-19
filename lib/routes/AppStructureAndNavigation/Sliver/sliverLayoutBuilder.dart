import 'package:flutter/material.dart';

class SliverLayoutBuilderPage extends StatefulWidget {
  @override
  _SliverLayoutBuilderState createState() => _SliverLayoutBuilderState();
}

class _SliverLayoutBuilderState extends State<SliverLayoutBuilderPage> {
  @override
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
              title: Text(
                'Sliver Ignore Pointer',
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue[900],
          ),
          SliverLayoutBuilder(
            builder: (context, constraints) {
              if (constraints.crossAxisExtent <= 400) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        width: 100,
                        color: Colors.red[100 * (index % 9) + 100],
                      );
                    },
                  ),
                );
              } else if (constraints.crossAxisExtent > 400 &&
                  constraints.crossAxisExtent <= 800) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        width: 200,
                        color: Colors.red[100 * (index % 9) + 100],
                      );
                    },
                  ),
                );
              }
              return SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    width: 200,
                    color: Colors.red[100 * (index % 9) + 100],
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
