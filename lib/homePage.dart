import 'package:flutter/material.dart';
import 'package:personal_website/shared/colors.dart';
import 'package:personal_website/widgets/dropMenue.dart';
import 'package:personal_website/widgets/header.dart';
import 'scroll.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  double menuHeight = 0.0;
  bool showMenu = false;
  List _isHoveringAppbar = [false, false, false];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if(width<=650){
      showMenu = true;
    }
    else{
      showMenu = false;
    }
    print("$width , $height");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent, elevation: 0.0,
          leading: showMenu?IconButton(
            icon: Icon(Icons.menu,size: 36,),
            onPressed: (){
              setState(() {
                menuHeight==0?menuHeight=width*0.4:menuHeight=0;
              });
              print(menuHeight);
            },
          ):Container(),

          actions: showMenu?<Widget>[]:<Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: InkWell(
                  onHover: (value) {
                    setState(() {
                      _isHoveringAppbar[0] = value;
                    });
                  },
                  onTap: (){},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        height: math.min(MediaQuery.of(context).size.width/2,500)*0.05,
                        child: FittedBox(
                          child: Text(
                            'About'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      // For showing an underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHoveringAppbar[0],
                        child: Container(
                          height: 2,
                          width: math.min(MediaQuery.of(context).size.width/2,500)*0.05,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: InkWell(
                  onHover: (value) {
                    setState(() {
                      _isHoveringAppbar[1] = value;
                    });
                  },
                  onTap: (){},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        height: math.min(MediaQuery.of(context).size.width/2,500)*0.05,
                        child: FittedBox(
                          child: Text(
                            'projects'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      // For showing an underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHoveringAppbar[1],
                        child: Container(
                          height: 2,
                          width: math.min(MediaQuery.of(context).size.width/2,500)*0.06,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: InkWell(
                  onHover: (value) {
                    setState(() {
                      _isHoveringAppbar[2] = value;
                    });
                  },
                  onTap: (){},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        height: math.min(MediaQuery.of(context).size.width/2,500)*0.05,
                        child: FittedBox(
                          child: Text(
                            'contact'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      // For showing an underline on hover
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHoveringAppbar[2],
                        child: Container(
                          height: 2,
                          width: math.min(MediaQuery.of(context).size.width/2,500)*0.06,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: width*0.05,)
          ],
        ),
      ),
      body:
         SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: MediaQuery.of(context).size.width,
                height: menuHeight,
                color: headerColor,
              ),
              Header(),
             Container(
               height: 400,
               color: headerColor,
             ),

              Container(
                height: 400,
                color: headerColor,
              ),

              Container(
                height: 400,
                color: headerColor,
              )

            ],
          ),
        ),
    );
  }
  }

