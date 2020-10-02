import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String lottery;

  ResultScreen({this.lottery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'သင်ထိုးထားသည့် ထီဆိုင်မှ ဖုန်းဆက်တာကို စောင့်လိုက်ပါ။',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Text('ကျေးဇူးတင်ပါသည်။', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
