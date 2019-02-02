import 'package:app_trabajo/pages/main_screen.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/login/firebaselogin.dart';
import 'package:flutter/material.dart';

class NumberVerificationScreen extends StatefulWidget {
  final String number;

  NumberVerificationScreen({this.number});

  @override
  State<StatefulWidget> createState() {
    return _NumberVerificationScreenState();
  }
}

class _NumberVerificationScreenState extends State<NumberVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _enableButton = false;
  Color _colorButton = Colors.grey;
  SmsVerification _smsVerification;
  BuildContext scaffoldContext;
  TextEditingController _verifyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _smsVerification = new SmsVerification(
        number: (widget.number),
        onWaiting: _callSnackBarOnWaiting,
        onAutomaticSuccess: _callSnackBarOnAutomaticSuccess,
        onAutomaticFailure: _callSnackBarOnAutomaticFailure,
        onManualSuccess: _callSnackBarOnManualSuccess,
        onManualFailure: _callSnackBarOnManualFailure,
        onErrorMessage: _callSnackBarrOnErrorMessage);
    _smsVerification.sendCodeToPhoneNumber().then((onValue) {
      setState(() {
        _enableButton = true;
        _colorButton = Colors.black;
      });
    }).catchError((onError) {
      print(onError);
      _callSnackBarrOnErrorMessage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext scaffoldContext) {
      this.scaffoldContext = scaffoldContext;
      return Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _setBackButton(),
                _setTitleLabel(),
                _setNumberLabel(),
                _setNumberField(),
                _setVerifyCodeField(),
                _setVerifyButton()
              ],
            ),
          ),
        ),
      );
    }));
  }

  Widget _setBackButton() {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back,
            size: 32.0,
          ),
        ),
      ]),
    );
  }

  Widget _setTitleLabel() {
    return Container(
        padding: EdgeInsets.only(left: 25.0, top: 10.0),
        child: Row(
          children: <Widget>[
            Text(StringConstants.setVerificationCode,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22.0,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'))
          ],
        ));
  }

  Widget _setNumberLabel() {
    return Container(
        padding: EdgeInsets.only(left: 25.0, top: 30.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Text(
            StringConstants.numberSended,
            style:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.w400),
          )
        ]));
  }

  Widget _setNumberField() {
    return Container(
        padding: EdgeInsets.only(left: 10.0, right: 20.0),
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
                    labelText: widget.number,
                  ),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Roboto'),
                  enabled: false,
                ),
              )
            ]));
  }

  Widget _setVerifyCodeField() {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(left: 10.0, right: 20.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _verifyController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.message,
                      color: Colors.black,
                    ),
                    labelText: StringConstants.code,
                    hintText: StringConstants.verifyCode,
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                  ),
                  maxLength: 6,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 0.3,
                      fontFamily: 'Roboto'),
                  validator: (value) {
                    if (value.isEmpty)
                      return StringConstants.emptyCamp;
                    else if (value.length < 6)
                      return StringConstants.incompleteCode;
                  },
                  keyboardType: TextInputType.phone,
                ),
              )
            ]));
  }

  Widget _setVerifyButton() {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(children: <Widget>[
              Expanded(
                  child: RaisedButton(
                onPressed: () {
                  _onPressedVerifyButton();
                },
                color: _colorButton,
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),
                child: Text(
                  StringConstants.verify,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 20.0,
                  ),
                ),
              ))
            ])));
  }

  Future<void> _onPressedVerifyButton() async {
    if (_enableButton) {
      if (_formKey.currentState.validate()) {
        await _smsVerification.signInWithPhoneNumber(_verifyController.text);
      }
    }
  }

  void _callSnackBarOnWaiting() {
    Scaffold.of(scaffoldContext)
        .showSnackBar(SnackBar(content: Text(StringConstants.checkingNumber)));
    Future.delayed(new Duration(seconds: 2), () {});
  }

  void _callSnackBarOnAutomaticSuccess() {
    Scaffold.of(scaffoldContext).showSnackBar(
        SnackBar(content: Text(StringConstants.successAutomaticNumber)));
    Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  void _callSnackBarOnAutomaticFailure() {
    Scaffold.of(scaffoldContext).showSnackBar(
        SnackBar(content: Text(StringConstants.failureAutomaticNumber)));
    Future.delayed(new Duration(seconds: 2), () {});
  }

  void _callSnackBarOnManualSuccess() {
    Scaffold.of(scaffoldContext).showSnackBar(
        SnackBar(content: Text(StringConstants.successManualNumber)));
    Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  void _callSnackBarOnManualFailure() {
    Scaffold.of(scaffoldContext).showSnackBar(
        SnackBar(content: Text(StringConstants.failureManualNumber)));
    Future.delayed(new Duration(seconds: 2), () {});
  }

  void _callSnackBarrOnErrorMessage() {
    Scaffold.of(scaffoldContext)
        .showSnackBar(SnackBar(content: Text(StringConstants.errorMessage)));
    Future.delayed(new Duration(seconds: 2), () {});
  }
}
