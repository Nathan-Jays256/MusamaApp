import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Musama/services/Authenticatiion_Services.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatefulWidget {
  final Function callBackHome;
  SignUpWidget({this.callBackHome});
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, password;
  bool _termsAgreed = true;
  bool _saveAttempted = false;

  _submit() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _saveAttempted = true;
      });
      _formKey.currentState.save();
    }
  }

  _buildEmailField() {
    return TextFormField(
      // ignore: deprecated_member_use
      autovalidate: _saveAttempted,
      decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
          hintText: "Email",
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(.6), fontSize: 22),
          icon: Icon(
            Icons.account_circle,
            size: 26,
            color: Colors.white,
          )),
      keyboardType: TextInputType.emailAddress,

      style: TextStyle(fontSize: 18, color: Colors.white),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email must be provided';
        }
        if (!RegExp(
                r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$')
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPassordField() {
    return TextFormField(
      // ignore: deprecated_member_use
      autovalidate: _saveAttempted,
      obscureText: true,
      // ignore: deprecated_member_use
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
          errorStyle: TextStyle(color: Colors.white),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: 'Password',
          hintStyle:
              TextStyle(fontSize: 22, color: Colors.white.withOpacity(.6)),
          focusColor: Colors.deepOrange,
          icon: Icon(
            Icons.lock,
            size: 26,
            color: Colors.white,
          )),
      style: TextStyle(fontSize: 18, color: Colors.white),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password must be provided';
        }
        if (value.length < 5 || value.length > 12) {
          return 'Password must be between 5 and 12 characters';
        }
        return null;
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget _buildConfirmPassordField() {
    return TextFormField(
      // ignore: deprecated_member_use
      // ignore: deprecated_member_use
      autovalidate: _saveAttempted,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: 'Confirm Password',
          hintStyle:
              TextStyle(fontSize: 22, color: Colors.white.withOpacity(.6)),
          errorStyle: TextStyle(color: Colors.white),
          icon: Icon(
            Icons.verified_user,
            size: 26,
            color: Colors.white,
          )),
      style: TextStyle(fontSize: 18, color: Colors.white),
      cursorColor: Colors.orange,
      obscureText: true,
      validator: (String value) {
        if (password != value) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "SIGN UP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Create a new account",
            style: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildEmailField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPassordField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildConfirmPassordField()
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: _termsAgreed,
                  onChanged: (newValue) {
                    setState(() {
                      _termsAgreed = newValue;
                    });
                  }),
              Text(
                "Agreed to the terms & Conditiions",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                color: Colors.red[900],
                onPressed: () {
                  widget.callBackHome();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              FlatButton(
                onPressed: () {
                  _submit();
                  context
                      .read<AuthenticationService>()
                      .signUp(email: email, password: password);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Color.fromRGBO(242, 80, 19, 1.0), fontSize: 22),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
