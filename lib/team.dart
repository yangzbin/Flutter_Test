import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的团队",style: TextStyle(fontSize: 17,color: Colors.white)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}