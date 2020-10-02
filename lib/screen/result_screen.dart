import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatefulWidget {
  final String lottery;

  ResultScreen({this.lottery});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.5,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 2),
              firstChild: _fstChild(context),
              secondChild: _secChild(context),
              crossFadeState: _crossFadeState,
            )),
      ),
    );
  }

  Widget _fstChild(BuildContext context) {
    return Container(
      child: Lottie.asset('assets/lottie/ribbon.json', fit: BoxFit.contain),
    );
  }

  Widget _secChild(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'သင်ထိုးထားသည့် ထီဆိုင်မှ ဖုန်းဆက်တာကို စောင့်လိုက်ပါ။',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16,),
        Text("(ง'̀-'́)ง", style: TextStyle(fontSize: 32))
      ],
    );
  }
}
