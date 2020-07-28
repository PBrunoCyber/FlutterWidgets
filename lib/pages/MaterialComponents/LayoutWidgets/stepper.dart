import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperPage> {
  List<String> _dados = List<String>(5);
  List<StepState> _stepState = List<StepState>(3);
  String _errorMessage = "Opps, há campos não preenchidos";
  StepperType stepperType = StepperType.vertical;

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps().length
        ? goTo(currentStep + 1)
        : (_dados[4] == "" ||
                _dados[0] == "" ||
                _dados[1] == "" ||
                _dados[2] == "" ||
                _dados[3] == "")
            ? _stepState[2] = StepState.error
            : setState(
                () => complete = true,
              );

    if (currentStep == 1) {
      _stepState[1] = StepState.editing;
      if (_dados[0] == "" || _dados[1] == "") {
        _stepState[0] = StepState.error;
      } else {
        _stepState[0] = StepState.complete;
      }
    }
    if (currentStep == 2) {
      if (_dados[2] == "" || _dados[3] == "") {
        _stepState[1] = StepState.error;
      } else {
        _stepState[1] = StepState.complete;
      }
      _stepState[2] = StepState.editing;
    }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  switchStepType() {
    setState(() {
      stepperType == StepperType.horizontal
          ? stepperType = StepperType.vertical
          : stepperType = StepperType.horizontal;
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _dados[i] = "";
    }
    _stepState[0] = StepState.editing;
    _stepState[1] = StepState.disabled;
    _stepState[2] = StepState.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Stepper"),
          centerTitle: true,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          complete
              ? Wrap(children: [
                  Center(
                    child: AlertDialog(
                      title: Text("Tudo certo? ", textAlign: TextAlign.center),
                      backgroundColor: Colors.white,
                      insetPadding: EdgeInsets.all(20),
                      titlePadding: EdgeInsets.all(20),
                      contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      titleTextStyle:
                          TextStyle(color: Colors.black, fontSize: 25),
                      content: Column(
                        children: <Widget>[
                          Text("Nome completo: " + _dados[4],
                              textAlign: TextAlign.left),
                          Divider(),
                          Text("Nome do pai: " + _dados[2],
                              textAlign: TextAlign.left),
                          Divider(),
                          Text("Nome da mãe: " + _dados[3],
                              textAlign: TextAlign.left),
                          Divider(),
                          Text("Email: " + _dados[0],
                              textAlign: TextAlign.left),
                          Divider(),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              complete = false;
                            });
                          },
                          child: Text(
                            "Sim",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              complete = false;
                            });
                          },
                          child: Text(
                            "Não",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ])
              : Expanded(
                  child: Stepper(
                    steps: steps(),
                    type: stepperType,
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepCancel: cancel,
                    physics: BouncingScrollPhysics(),
                    onStepTapped: (value) => goTo(value),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.blue[900],
        disabledElevation: 0,
        child: Icon(
          Icons.cached,
        ),
      ),
    );
  }

  List<Step> steps() {
    return [
      Step(
        title: Text("Sua conta"),
        isActive: currentStep == 0 ? true : false,
        state: _stepState[0],
        subtitle: (_stepState[0] == StepState.error)
            ? Text(_errorMessage)
            : (_stepState[0] == StepState.complete)
                ? Text("Ok!")
                : Text("Digite seu e-mail e senha!"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Email address"),
              onChanged: (value) {
                setState(() {
                  this._dados[0] = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  this._dados[1] = value;
                });
              },
            ),
          ],
        ),
      ),
      Step(
        title: Text("Filiação"),
        isActive: currentStep == 1 ? true : false,
        state: _stepState[1],
        subtitle: (_stepState[1] == StepState.error)
            ? Text(_errorMessage)
            : (_stepState[1] == StepState.complete)
                ? Text("Ok!")
                : Text("Digite sua filiação!"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Nome do pai"),
              onChanged: (value) {
                setState(() {
                  this._dados[2] = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Nome da mãe"),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  this._dados[3] = value;
                });
              },
            ),
          ],
        ),
      ),
      Step(
        title: Text("Dados pessoais"),
        isActive: currentStep == 2 ? true : false,
        state: _stepState[2],
        subtitle: (_stepState[2] == StepState.error)
            ? Text(_errorMessage)
            : (_stepState[2] == StepState.complete)
                ? Text("Ok!")
                : Text("Digite seu nome"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Nome completo"),
              onChanged: (value) {
                setState(() {
                  this._dados[4] = value;
                });
              },
            )
          ],
        ),
      ),
    ];
  }
}
