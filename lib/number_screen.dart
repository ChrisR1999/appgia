import 'package:app_trabajo/utilities/string_constants.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: StringConstants.appBarTitle,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.appBarTitle),
          backgroundColor: Colors.black,
        ),
        body: NumberForm(),
      ),
    );
  }
}

class NumberForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NumberFormState();
  }
}

class _NumberFormState extends State<NumberForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[_setTextField(), _setSendButton()],
          ),
        ),
      ),
    );
  }

  Widget _setTextField() {
    return Container(
        padding: EdgeInsets.only(left: 10.0, right: 20.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                    hintText: StringConstants.setPhoneNumber,
                    labelText: StringConstants.number,
                  ),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 0.3,
                      fontFamily: 'Roboto'),
                  maxLength: 13,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty)
                      return StringConstants.emptyCamp;
                    else if (!(value.contains('+')))
                      return StringConstants.prefixIncomplete;
                    else if (value.length < 13)
                      return StringConstants.incompleteNumber;
                  },
                ),
              )
            ]));
  }

  Widget _setSendButton() {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: RaisedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(StringConstants.processing)));
            }
          },
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),
          child: Text(
            StringConstants.send,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 20.0,
            ),
          ),
        ));
  }
}
