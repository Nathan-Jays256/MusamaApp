import 'package:Musama/Pages/signin/options.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:Musama/services/Utils.dart';

import 'package:page_transition/page_transition.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: screenAwaresize(double.infinity, context),
              height: screenAwaresize(465, context),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image.asset(
                    "images/Intro-lg2.png",
                    fit: BoxFit.cover,
                  ),
                ],
              )),
          // Text(
          //   "MUSAMA ONLINE SHOP",
          //   style: TextStyle(
          //       color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
          // ),
          // Container(
          //     width: double.infinity,
          //     height: 175,
          //     decoration: BoxDecoration(
          //       color: Colors.orange[800],
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(15.0),
          //           topRight: Radius.circular(15.0)),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(5.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: <Widget>[
          //           Text(
          //             "The Online Shop where your products meet the our potential buyers meet the our potential buyers",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white70,
          //                 // fontWeight: FontWeight.w600,
          //                 fontSize: 14.0),
          //           ),
          //           // SizedBox(
          //           //   height: 10.0,
          //           // ),
          //           // Container(
          //           //     width: 80.0,
          //           //     height: 80.0,
          //           //     padding: EdgeInsets.all(8.0),
          //           //     decoration: BoxDecoration(
          //           //         borderRadius: BorderRadius.circular(50.0),
          //           //         color: Colors.green.withOpacity(.3)),
          //           //     child: Container(
          //           //       width: 60.0,
          //           //       height: 60.0,
          //           //       padding: EdgeInsets.all(8.0),
          //           //       decoration: BoxDecoration(
          //           //           borderRadius: BorderRadius.circular(50.0),
          //           //           color: Colors.blue.withOpacity(.3)),
          //           //       child: Container(
          //           //         width: 60.0,
          //           //         height: 60.0,
          //           //         decoration: BoxDecoration(
          //           //             shape: BoxShape.circle, color: Colors.white),
          //           //         child: Icon(
          //           //           Icons.keyboard_arrow_right,
          //           //           color: Colors.orange[800],
          //           //           size: 36.0,
          //           //         ),
          //           //       ),
          //           //     ))
          //         ],
          //       ),
          //     ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.orange,
        child: AvatarGlow(
          curve: Curves.easeOut,
          startDelay: Duration(milliseconds: 100),
          glowColor: Colors.white,
          endRadius: 55.0,
          duration: Duration(milliseconds: 1500),
          repeat: true,
          showTwoGlows: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: SignIn(), type: PageTransitionType.fade));
            },
            elevation: 20.0,
            shape: CircleBorder(),
            child: Container(
              width: 50.0,
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 35,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
