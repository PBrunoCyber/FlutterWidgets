import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class StreamBuilderUserPage extends StatefulWidget {
  @override
  _StreamBuilderUserState createState() => _StreamBuilderUserState();
}

class _StreamBuilderUserState extends State<StreamBuilderUserPage> {
  List<User> _user;
  StreamController<List<User>> _streamController;
  ScrollController _scrollController;

  @override
  void initState() {
    _user = [
      User(
          nome: "Paulo Bruno",
          idade: 20,
          logradouro: "Conjunto Paraíso",
          avartarUrl:
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
      User(
          nome: "Junior Sousa",
          idade: 20,
          logradouro: "Campo Velho",
          avartarUrl:
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
      User(
          nome: "Maria Joaquina",
          idade: 20,
          logradouro: "Centro",
          avartarUrl:
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
      User(
          nome: "Débora Ramalho",
          idade: 20,
          logradouro: "Meladão",
          avartarUrl:
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
      User(
          nome: "Marcos Mendes",
          idade: 20,
          logradouro: "Manguinha",
          avartarUrl:
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
      User(
          nome: "Felipe Cimas",
          idade: 20,
          logradouro: "Irapuá I",
          avartarUrl:
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
      User(
          nome: "Lucas Ferreira",
          idade: 20,
          logradouro: "Irapuá II",
          avartarUrl:
              "https://cdn.pixabay.com/photo/2013/07/13/11/56/frog-159002_960_720.png"),
    ];
    _streamController = StreamController<List<User>>();
    _streamController.add(_user);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade100,
      navigationBar: CupertinoNavigationBar(
        middle: Text("Stream Builder User"),
        backgroundColor: Colors.grey.shade200,
        trailing: GestureDetector(
          onTap: () => _addUser(context),
          child: Icon(Icons.add_circle_outline, color: Colors.green),
        ),
      ),
      child: Center(
        child: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            List<User> _users = snapshot.data;
            Widget _list;
            if (snapshot.hasError) {
              _list = Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close, size: 90, color: Colors.red),
                  Text(
                    "Oops, aconteceu algum erro!",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              );
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return CupertinoActivityIndicator();
                  break;
                case ConnectionState.waiting:
                  return CupertinoActivityIndicator();
                  break;
                case ConnectionState.active:
                  return _list = ListView.builder(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      return _list = Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                _users[index].avartarUrl,
                                height: 80,
                                width: 80,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return CupertinoActivityIndicator();
                                },
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _users[index].nome,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text(
                                          _users[index].logradouro,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Idade: " + _users[index].idade.toString(),
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  break;
                case ConnectionState.done:
                  break;
              }
            }
            return _list;
          },
        ),
      ),
    );
  }

  void _addUser(BuildContext context) async {
    var response = await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return AddUserModal();
      },
    );
    setState(() {
      if (response != null) {
        _user.add(response);
        _streamController.add(_user);
        Future.delayed(Duration(milliseconds: 100), () {
          _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(seconds: 4),
              curve: Curves.elasticOut);
        });
      }
    });
  }
}

class AddUserModal extends StatefulWidget {
  @override
  _AddUserModalState createState() => _AddUserModalState();
}

class _AddUserModalState extends State<AddUserModal>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  String _name, _age, _address, _avatarUrl;
  User _user;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(CurvedAnimation(curve: Curves.ease, parent: _controller));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + 40,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 40, right: 10, left: 10),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("User Information",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: CupertinoTextField(
                      placeholder: "Type your name",
                      padding: EdgeInsets.all(10),
                      suffix: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.arrow_upward),
                      ),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      onChanged: (value) => setState(() => _name = value),
                    )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: CupertinoTextField(
                      padding: EdgeInsets.all(10),
                      suffix: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.arrow_upward),
                      ),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      placeholder: "Type your address",
                      onChanged: (value) => setState(() => _address = value),
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CupertinoTextField(
                    placeholder: "Type your age",
                    padding: EdgeInsets.all(10),
                    suffix: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.arrow_upward),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() => _age = value),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: CupertinoTextField(
                      placeholder: "Type your avatarUrl",
                      padding: EdgeInsets.all(10),
                      suffix: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.arrow_upward),
                      ),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      onChanged: (value) => setState(() => _avatarUrl = value),
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: OutlineButton(
                    child: Text("Send data"),
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 15, bottom: 15),
                    borderSide: BorderSide(color: Colors.black),
                    onPressed: () {
                      if (_name == null ||
                          _address == null ||
                          _age == null ||
                          _avatarUrl == null) {
                        return;
                      } else {
                        _user = User(
                          nome: _name,
                          logradouro: _address,
                          idade: int.parse(_age),
                          avartarUrl: _avatarUrl,
                        );
                        _controller.forward();
                        Future.delayed(Duration(milliseconds: 900), () {
                          Navigator.of(context).pop(_user);
                          _controller.reverse();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  String nome;
  int idade;
  String logradouro;
  String avartarUrl;

  User(
      {@required this.nome,
      @required this.idade,
      @required this.logradouro,
      @required this.avartarUrl});
}
