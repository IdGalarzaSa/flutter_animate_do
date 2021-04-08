import 'package:animate_do_app/src/pages/navigation_page.dart';
import 'package:animate_do_app/src/pages/page1_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animate_do',
      initialRoute: NavigationPage.routeName,
      routes: {
        Page1.routeName: (BuildContext context) => Page1(),
        TwitterPage.routeName: (BuildContext context) => TwitterPage(),
        NavigationPage.routeName: (BuildContext context) => NavigationPage(),
      },
    );
  }
}
