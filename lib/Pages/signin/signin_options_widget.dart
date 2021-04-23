import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInOptionsWidget extends StatelessWidget {
  final Function goToSignUp;
  final Function goToSignIn;

  SignInOptionsWidget({this.goToSignUp, this.goToSignIn});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.facebookF,
                color: Color.fromRGBO(242, 80, 19, 1.0),
                size: 30.0,
              ),
              Text(
                "  | Sign-in with Facebook",
                style: TextStyle(
                    color: Color.fromRGBO(242, 80, 19, 1.0),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.twitter,
                color: Color.fromRGBO(242, 80, 19, 1.0),
                size: 30.0,
              ),
              Text(
                "  | SignIn with Twitter",
                style: TextStyle(
                    color: Color.fromRGBO(242, 80, 19, 1.0),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        InkWell(
          onTap: () {
            goToSignUp();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color.fromRGBO(242, 80, 19, 1.0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        InkWell(
          onTap: () {
            goToSignIn();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ALREADY REGISTERED? ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "Sign In",
                style: TextStyle(
                    color: Color.fromRGBO(254, 244, 0, 1.0), fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
