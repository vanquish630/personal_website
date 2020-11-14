import 'package:flutter/material.dart';
import 'package:personal_website/shared/colors.dart';
import 'package:personal_website/widgets/dropMenue.dart';
import 'package:personal_website/widgets/header.dart';
import 'scroll.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
double menuHeight = 0.0;
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("$width , $height");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            setState(() {
              menuHeight==0?menuHeight=width*0.4:menuHeight=0;
            });
            print(menuHeight);
          },
        ),
      ),
      body: SingleChildScrollView(

          child: Column(
            children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: MediaQuery.of(context).size.width,
            height: menuHeight,
            color: headerColor,
          ),
              Header(),
            ],
          )

      ),
    );
  }
  }

