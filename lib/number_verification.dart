import 'package:app_trabajo/styles/appbar_style.dart';
import 'package:app_trabajo/styles/themedata_style.dart';
import 'package:app_trabajo/utilities/string_constants.dart';
import 'package:flutter/material.dart';

class NumberVerification extends StatelessWidget {
  final String number;

  NumberVerification({this.number = "3318529246"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeDataWidget.getThemeData(),
      title: StringConstants.appBarTitle,
      home: Scaffold(
        appBar: AppBarWidget.getAppBar(),
        body: NumberVerificationForm(number),
      ),
    );
  }
}

class NumberVerificationForm extends StatefulWidget {
  final String number;

  NumberVerificationForm(this.number);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NumberVerificationFormState();
  }
}

class _NumberVerificationFormState extends State<NumberVerificationForm> {
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
            children: <Widget>[
              _setNumberField(),
              _setVerifyCodeField(),
              _setVerifyButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _setNumberField() {
    return Container(
        padding: EdgeInsets.only(left: 15.0, right: 25.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                    labelText: '+523318529246',
                  ),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 0.3,
                      fontFamily: 'Roboto'),
                  enabled: false,
                ),
              )
            ]));
  }

  Widget _setVerifyCodeField() {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 15.0, right: 25.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.message,
                      color: Colors.black,
                    ),
                    labelText: StringConstants.code,
                    hintText: StringConstants.verifyCode,
                  ),
                  maxLength: 6,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 0.3,
                      fontFamily: 'Roboto'),
                  validator: (value){
                    if(value.isEmpty)
                      return StringConstants.emptyCamp;
                    else if(value.length < 6)
                      return StringConstants.incompleteCode;
                  },
                ),
              )
            ]));
  }

  Widget _setVerifyButton() {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: RaisedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Scaffold.of(context)
                  .showSnackBar(
                  SnackBar(content: Text(StringConstants.processing)));
            }
          },
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),
          child: Text(
            StringConstants.verify,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 20.0,
            ),
          ),
        ));
  }
}
