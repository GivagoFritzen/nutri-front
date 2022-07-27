import 'package:flutter/material.dart';
import '../components/leftBar.dart';
import '../components/topBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget getHome() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar(),
          //LeftBar(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getHome());
  }
}
