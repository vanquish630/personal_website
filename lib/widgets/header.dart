import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:personal_website/shared/colors.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double height = math.min(MediaQuery.of(context).size.width/2,500);
    double width = MediaQuery.of(context).size.width;


    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 36),
          alignment: Alignment.topCenter,
          height: height,
          //currentScreenType == "small"?300:currentScreenType == "medium"?350:400,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: headerColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/headerPortfolio.png",),
              )),
        ),
        Positioned(
          top: height*0.3,
          left: width*0.02,
          child: Container(
            padding: EdgeInsets.all(24),
            width: MediaQuery.of(context).size.width*0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0),
                  /*constraints: BoxConstraints(
                      maxHeight: 40.0,
                     maxWidth:
                  ),*/
                  height: height*0.1,

                  child: FittedBox(
                    child: Text("Hello,",style: TextStyle(
                        color: Colors.white,
                        //fontSize: 48
                    ),),
                  ),
                ),

                Container(
                  height: height*0.3,
                  child: FittedBox(
                    child: TypewriterAnimatedTextKit(
                        speed: Duration(milliseconds: 200),
                        totalRepeatCount: 0,
                        isRepeatingAnimation: false,
                        repeatForever: false, //this will ignore [totalRepeatCount]
                        pause: Duration(milliseconds:  1000),
                        text: ["I'm Sohan Anisetty"],
                        textStyle: TextStyle(color: Colors.white,),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true
                    ),/*Text("I'm Sohan Anisetty",style: TextStyle(
                        color: Colors.white,
                        //fontSize: 120
                    ),
                    ),*/
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

