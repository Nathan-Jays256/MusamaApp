import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Musama/services/Authenticatiion_Services.dart';
import 'package:provider/provider.dart';

class SignIN extends StatefulWidget {
  final Function callBackHome;
  SignIN({this.callBackHome});
  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  String email, password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _rememberPassword = true;
  _buildEmailField() {
    return TextFormField(
      // ignore: deprecated_member_use

      decoration: InputDecoration(
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

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      // ignore: deprecated_member_use
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "SIGN IN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Login into your account",
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
                  _buildPasswordField(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: _rememberPassword,
                  onChanged: (newValue) {
                    setState(() {
                      _rememberPassword = newValue;
                    });
                  }),
              Text(
                "Remember password",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 50.0,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              _formKey.currentState.save();
              context
                  .read<AuthenticationService>()
                  .signIn(email: email, password: password);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Color.fromRGBO(242, 80, 19, 1.0), fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: null,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Color.fromRGBO(242, 80, 19, 1.0),
                    )),
              ),
              SizedBox(width: 30.0),
              InkWell(
                onTap: null,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      FontAwesomeIcons.twitter,
                      color: Color.fromRGBO(242, 80, 19, 1.0),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                onPressed: () {
                  widget.callBackHome();
                },
                child: Icon(
                  FontAwesomeIcons.solidArrowAltCircleLeft,
                  color: Colors.white,
                ),
              ),
              Text(
                "FORGOT PASSWORD ?!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
