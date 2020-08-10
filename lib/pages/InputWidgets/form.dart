import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FormPage extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name, _emailAddress;
  List<TextEditingController> _list;

  void _showDatas(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return ShowInformations(name: _name, emailAddress: _emailAddress);
      },
    );
  }

  @override
  void initState() {
    _list = [
      TextEditingController(),
      TextEditingController(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Form"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _list[0],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Name"),
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter some text';
                      return null;
                    },
                    onChanged: (value) => setState(() => _name = value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _list[1],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email Address"),
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter some text';
                      return null;
                    },
                    onChanged: (value) => setState(() => _emailAddress = value),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: CupertinoButton.filled(
                      child: Text("Send Data"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          for (var item in _list) {
                            item.clear();
                          }
                          return _showDatas(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShowInformations extends StatefulWidget {
  final String name, emailAddress;
  ShowInformations({@required this.name, @required this.emailAddress});
  @override
  _ShowInformationsState createState() => _ShowInformationsState();
}

class _ShowInformationsState extends State<ShowInformations>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline, size: 90, color: Colors.green),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.emailAddress,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
