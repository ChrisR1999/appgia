import 'package:app_trabajo/styles/appbar_style.dart';
import 'package:app_trabajo/styles/themedata_style.dart';
import 'package:app_trabajo/number_verification.dart';
import 'package:app_trabajo/utils/string_utils.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loginselect/numberscreen/numberverification': (context) =>
            NumberVerification()
      },
      title: StringUtils.appBarTitle,
      theme: ThemeDataStyle.getThemeData(),
      home: Scaffold(
        appBar: AppBarStyle.getAppBar(),
        body: _NumberForm(),
      ),
    );
  }
}

class _NumberForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __NumberFormState();
  }
}

class __NumberFormState extends State<_NumberForm> {
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
                    hintText: StringUtils.setPhoneNumber,
                    labelText: StringUtils.number,
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
                      return StringUtils.emptyCamp;
                    else if (!(value.contains('+')))
                      return StringUtils.prefixIncomplete;
                    else if (value.length < 13)
                      return StringUtils.incompleteNumber;
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
                  SnackBar(content: Text(StringUtils.processing)));
              Navigator.pushNamed(
                  context, '/loginselect/numberscreen/numberverification');
            }
          },
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),
          child: Text(
            StringUtils.send,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 20.0,
            ),
          ),
        ));
  }
}
