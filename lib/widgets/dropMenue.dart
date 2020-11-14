import 'package:flutter/material.dart';
import 'package:personal_website/shared/colors.dart';

class DropMenu extends StatefulWidget {
  double height;
  DropMenu({height});
  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 100),
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      color: headerColor,
    );
  }
}
