import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadeState createState() => _AnimatedCrossFadeState();
}

class _AnimatedCrossFadeState extends State<AnimatedCrossFadePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text("Animated Cross Fade"),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: Center(
        child: BotaoSheet(),
      ),
    );
  }
}

class BotaoSheet extends StatefulWidget {
  @override
  _BotaoSheetState createState() => _BotaoSheetState();
}

class _BotaoSheetState extends State<BotaoSheet> {
  bool isActive = false, _change = false;
  String text = "Mostrar";
  TextEditingController _nome;
  String nome = "";

  @override
  void initState() {
    _nome = TextEditingController();
    _nome.clear();
    super.initState();
  }

  @override
  void dispose() {
    _nome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Botao de mostrar/fechar
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        if (isActive) {
          Navigator.of(context).pop();
          setState(() {
            isActive = false;
            text = "Mostrar";
          });
        } else {
          Future.delayed(Duration(microseconds: 500), () {
            _nome.clear();
          });
          setState(
            () {
              isActive = true;
              text = "Fechar";
            },
          );
          var close = _showBottomSheet(context);
          close.closed.then((values) {
            setState(() {
              isActive = false;
              _change = false;
              text = "Mostrar";
            });
          });
        }
      },
    );
  }

  //Bottom Sheet
  _showBottomSheet(BuildContext context) {
    return showBottomSheet(
      context: context,
      backgroundColor: Colors.grey[100],
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
      builder: (context) {
        return Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            AnimatedCrossFade(
              firstChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Text(
                        "Digite seu nome",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _nome,
                      onChanged: (value) {
                        setState(() {
                          nome = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome completo",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                    child: RaisedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          _change = true;
                        });
                      },
                      color: Colors.indigo[400],
                      elevation: 1,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 50,
                          child: Center(
                              child: Text("Enviar",
                                  style: TextStyle(color: Colors.white)))),
                      splashColor: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
              secondChild: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
                          child: Text(
                            nome,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.check,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.indigo[400],
                              ),
                            ))
                      ]),
                ),
              ),
              crossFadeState: _change
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 900),
              firstCurve: Curves.ease,
              secondCurve: Curves.easeInToLinear,
              sizeCurve: Curves.easeInBack,
              alignment: Alignment.center,
            )
          ],
        );
      },
    );
  }
}
