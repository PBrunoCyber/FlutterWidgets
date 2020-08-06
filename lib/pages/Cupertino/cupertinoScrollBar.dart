import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoScrollBarPage extends StatefulWidget {
  @override
  _CupertinoScrollBarState createState() => _CupertinoScrollBarState();
}

class _CupertinoScrollBarState extends State<CupertinoScrollBarPage>
    with SingleTickerProviderStateMixin {
  //Variables
  final _itensScrollBar =
      List<String>.generate(20, (index) => "ScrollBar $index");

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //List
    Widget _list = ListView.builder(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      itemCount: _itensScrollBar.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          margin: EdgeInsets.only(bottom: 10),
          decoration: ShapeDecoration(
              color: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Center(
            child: Text(
              _itensScrollBar[index],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        );
      },
    );
    //Future
    Future.delayed(Duration(seconds: 0), () {
      _scrollController.animateTo(6.0 * 100 + (6 - 1) * 10,
          duration: Duration(seconds: 4), curve: Curves.elasticOut);
    });

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Scroll Bar"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CupertinoScrollbar(
          child: _list,
        ),
      ),
    );
  }
}
