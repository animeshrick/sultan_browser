import 'package:flutter/material.dart';

import 'browser_mainpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          //CollapsingNavigationDrawer(),
          MyHomePage(context),
        ],
      ),
    );
  }
}
