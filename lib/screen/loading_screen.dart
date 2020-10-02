import 'dart:async';

import 'package:aung_bar_lay/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final String lottery;

  LoadingScreen({this.lottery});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  _startTime() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, _route);
  }

  void _route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(lottery: widget.lottery)));
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ခေတ္တစောင့်ပါ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text('ထီဂဏန်း ${widget.lottery} ကို စစ်ဆေးနေပါသည်။',
                style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
            SizedBox(height: 16),
            CupertinoActivityIndicator(),
            SizedBox(height: 8),
            Text('Checking to server...')
          ],
        ),
      ),
    );
  }
}
