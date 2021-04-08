import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  static final String routeName = "TwitterPage";

  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activeAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activeAnimation,
          from: 30,
          duration: Duration(seconds: 1),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.amber,
        onPressed: () {
          setState(() {
            activeAnimation = !activeAnimation;
          });
        },
      ),
    );
  }
}
