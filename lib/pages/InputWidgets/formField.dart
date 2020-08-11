import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldPage extends StatefulWidget {
  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormFieldPage> {
  final _formState = GlobalKey<FormState>();
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Form Field"),
        backgroundColor: Colors.grey.shade200,
      ),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoNameField(
                    autovalidate: false,
                    initialValue: this._name,
                    validator: (value) {
                      if (value == "") return "Campo Obrigatório!";
                      return null;
                    },
                    onSaved: (newValue) =>
                        setState(() => this._name = newValue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoButton.filled(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formState.currentState.validate())
                        setState(() {
                          this._formState.currentState.save();
                        });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    this._name,
                    style: Theme.of(context).textTheme.bodyText2,
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

class CupertinoNameField extends FormField<String> {
  CupertinoNameField(
      {FormFieldSetter<String> onSaved,
      FormFieldValidator<String> validator,
      bool autovalidate = false,
      String initialValue = ""})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          initialValue: initialValue,
          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoTextField(
                  placeholder: "Type your name",
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  onChanged: (value) {
                    state.didChange(value);
                  },
                ),
                state.hasError
                    ? Text(
                        state.errorText,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: "Arial",
                          fontSize: 12,
                        ),
                      )
                    : Container()
              ],
            );
          },
        );
}
