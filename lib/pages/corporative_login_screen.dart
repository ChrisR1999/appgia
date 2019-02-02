import 'package:app_trabajo/widgets/appbar.dart';
import 'package:app_trabajo/styles/themedata_style.dart';
import 'package:app_trabajo/pages/main_screen.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:flutter/material.dart';

class CorporativeLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loginselect/Userscreen/CorporativeLoginForm/mainscreen': (context) =>
            MainScreen(),
      },
      theme: ThemeDataStyle.getThemeData(),
      title: StringConstants.appBarTitle,
      home: Scaffold(
        appBar: AppBarWidget.getAppBar(),
        body: _CorporativeLoginForm(),
      ),
    );
  }
}

class _CorporativeLoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __CorporativeLoginFormState();
  }
}

class __CorporativeLoginFormState extends State<_CorporativeLoginForm> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _setUserField(),
              _setPasswordField(),
              _setConfirmButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _setUserField() {
    return Container(
        padding: EdgeInsets.only(left: 15.0, right: 25.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.black,
                    ),
                    labelText: StringConstants.userLabel,
                    hintText: StringConstants.setUser,
                  ),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 0.3,
                      fontFamily: 'Roboto'),
                  validator: (value) {
                    if (value.isEmpty)
                      return StringConstants.emptyCamp;
                    else if (value.length < 6)
                      return StringConstants.userIncomplete;
                  },
                ),
              )
            ]));
  }

  Widget _setPasswordField() {
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
                      Icons.code,
                      color: Colors.black,
                    ),
                    labelText: StringConstants.passwordLabel,
                    hintText: StringConstants.setPassword,
                  ),
                  maxLength: 32,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 0.3,
                      fontFamily: 'Roboto'),
                  validator: (value) {
                    if (value.isEmpty) return StringConstants.emptyCamp;
                  },
                ),
              )
            ]));
  }

  Widget _setConfirmButton() {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: RaisedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(StringConstants.processing)));
              Navigator.pushNamed(context,
                  '/loginselect/Userscreen/CorporativeLoginForm/mainscreen');
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
