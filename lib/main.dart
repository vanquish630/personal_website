

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/homePage.dart';
import 'package:personal_website/scroll.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scroll To Index Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()/*MyHomePage(title: 'Scroll To Index Demo')*/,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const maxCount = 4;
  final random = math.Random();
  final scrollDirection = Axis.vertical;

  AutoScrollController controller;
  List<List<int>> randomList;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection,
    );
    randomList = List.generate(maxCount, (index) => <int>[index, (1000 * random.nextDouble()).toInt()]);
  }

 var small = 600;
  var medium  = 1000;
  var large;
  var currentScreenType;

  @override
  void didChangeDependencies() {
    if(MediaQuery.of(context).size.width<=small){
      currentScreenType = "small";
    }
    if(MediaQuery.of(context).size.width>small && MediaQuery.of(context).size.width<=medium){
      currentScreenType = "medium";
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width<=small){
      currentScreenType = "small";
    }
    if(MediaQuery.of(context).size.width>small && MediaQuery.of(context).size.width<=medium){
      currentScreenType = "medium";
    }
    print(MediaQuery.of(context).size.width,);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
      ),
      body: ListView(
          padding: EdgeInsets.only(top: 0),
        scrollDirection: scrollDirection,
        controller: controller,
        children: <Widget>[

          _wrapScrollTag(
            index: 0,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 36),
                  alignment: Alignment.topCenter,
                  height: math.min(MediaQuery.of(context).size.width/2,450),
                  //currentScreenType == "small"?300:currentScreenType == "medium"?350:400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/headerPortfolio.png"),
                      )),
                ),
                Positioned(
                  top: 80,
                  left: 40,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0),

                          child: Text("Hello,",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),),
                        ),

                        FittedBox(
                          child: Text("I'm Sohan Anisetty",style: TextStyle(
                              color: Colors.white,
                              fontSize: 96
                          ),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),



          ),
          _wrapScrollTag(
              index: 1,
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.topCenter,
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2
                    ),
                ),
                child: Text('index: 1, height: 400'),
              )
          ),
          _wrapScrollTag(
              index: 2,
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.topCenter,
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2
                    ),
                ),
                child: Text('index: 2, height: 400'),
              )
          ),
          _wrapScrollTag(
              index: 2,
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.topCenter,
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2
                    ),
                ),
                child: Text('index: 3, height: 400'),
              )
          ),
      ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToIndex,
        tooltip: 'Increment',
        child: Text(counter.toString()),
      ),
    );
  }

  int counter = 0;
  Future _scrollToIndex() async {
    setState(() {
      counter = counter+1;

      if (counter >= maxCount)
        counter = 0;
    });

    await controller.scrollToIndex(counter, preferPosition: AutoScrollPosition.begin);
    controller.highlight(counter);
  }

  Widget _getRow(int index, double height) {
    return _wrapScrollTag(
        index: index,
        child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.topCenter,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.lightBlue,
                  width: 4
              ),
              borderRadius: BorderRadius.circular(12)
          ),
          child: Text('index: $index, height: $height'),
        )
    );
  }

  Widget _wrapScrollTag({int index, Widget child})
  => AutoScrollTag(
    key: ValueKey(index),
    controller: controller,
    index: index,
    child: child,
    highlightColor: Colors.black.withOpacity(0.1),
  );
}