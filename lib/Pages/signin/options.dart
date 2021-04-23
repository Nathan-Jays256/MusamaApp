import 'package:flutter/material.dart';

import 'signUp.dart';
import 'signin.dart';
import 'signin_options_widget.dart';

//mega good : nj1179722@gmail.com :0777117009
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: AssetImage("images/Icon.jpg"))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MUSA",
                      style: TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("MA",
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
                Text(
                  "Shop online, Delivered at your doorstep",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: <Widget>[
                      SignInOptionsWidget(goToSignIn: () {
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      }, goToSignUp: () {
                        pageController.animateToPage(2,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      }),
                      SignIN(callBackHome: () {
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      }),
                      SignUpWidget(callBackHome: () {
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "@Copyright Musama",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(.5),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(244, 132, 23, 1.0),
              Color.fromRGBO(242, 80, 19, 1.0),
            ])),
      ),
    );
  }
}
