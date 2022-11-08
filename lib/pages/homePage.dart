import 'package:flutter/material.dart';
import 'package:nutri/components/leftBar.dart';

import '../components/topBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white24,
        child: Column(
          children: [
            const TopBar(),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height - TopBar.GetHeightSize(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LeftBar(),
                  Container(
                    color: Colors.white24,
                    width:
                    MediaQuery.of(context).size.width - LeftBar.GetWidth(),
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
