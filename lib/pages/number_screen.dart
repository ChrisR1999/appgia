import 'package:app_trabajo/pages/number_verification.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __NumberScreenState();
  }
}

class __NumberScreenState extends State<NumberScreen> {
  final TextEditingController _textEditController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  BuildContext scaffoldContext;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(body: Builder(builder: (BuildContext scaffoldContext) {
        this.scaffoldContext = scaffoldContext;
        return Form(
          key: _formKey,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _setNumberTitle(),
                  _setNumberField(),
                  _setMessageAdvertisment(),
                  _setSendButton(),
                ],
              ),
            ),
          ),
        );
      })),
      onWillPop: () {
        Future(() => false);
      },
    );
  }

  Widget _setNumberTitle() {
    return Container(
        padding: EdgeInsets.only(left: 25.0, top: 25.0),
        child: Row(
          children: <Widget>[
            Text(StringConstants.setPhoneNumber,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'))
          ],
        ));
  }

  Widget _setNumberField() {
    return Container(
        padding: EdgeInsets.only(left: 10.0, right: 20.0, top: 25.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Material(
                        child: TextFormField(
                      controller: _textEditController,
                      decoration: InputDecoration(
                        icon: Text(
                          StringConstants.phonePrefix,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto'),
                        ),
                        hintStyle: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                        hintText: StringConstants.setPhoneNumber,
                        counterText: '',
                        counterStyle: TextStyle(fontSize: 0),
                      ),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          letterSpacing: 1.5,
                          fontFamily: 'Roboto'),
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) return StringConstants.emptyCamp;
                        if (value.length < 10)
                          return StringConstants.incompleteNumber;
                      },
                    ))),
              ),
            ]));
  }

  Widget _setMessageAdvertisment() {
    return Padding(
        padding: EdgeInsets.only(left: 25.0, right: 20.0),
        child: Text(
          StringConstants.messageAdvertisement,
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400),
        ));
  }

  Widget _setSendButton() {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Row(children: <Widget>[
            Expanded(
                child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  callSnackBar();
                }
              },
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 30.0),
              child: Text(
                StringConstants.send,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                ),
              ),
            ))
          ])),
    );
  }

  void callSnackBar() {
    Scaffold.of(scaffoldContext)
        .showSnackBar(SnackBar(content: Text(StringConstants.sendingMessage)));
    Future.delayed(new Duration(seconds: 3), () {
      Scaffold.of(scaffoldContext).hideCurrentSnackBar();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NumberVerificationScreen(
                  number:
                      (StringConstants.phonePrefix + _textEditController.text),
                )),
      );
    });
  }
}
