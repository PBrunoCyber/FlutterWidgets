import 'package:flutter/material.dart';

class SliverToBoxAdapterPage extends StatefulWidget {
  @override
  _SliverToBoxAdapterState createState() => _SliverToBoxAdapterState();
}

class _SliverToBoxAdapterState extends State<SliverToBoxAdapterPage> {
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
              title: Text('SliverToBoxAdapter'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height - 50,
              color: Colors.indigo[200],
            ),
          )
        ],
      ),
    );
  }
}
