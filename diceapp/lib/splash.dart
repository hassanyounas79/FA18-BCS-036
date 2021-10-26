import 'package:flutter/material.dart';
import 'package:diceapp/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _mainPage();
  }

  _mainPage() async {
    await Future.delayed(
      const Duration(milliseconds: 2900),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const DiceApp()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Image(
          height: 200,
          width: 200,
          image: AssetImage('images/ludo.png'),
        ),
      ),
    );
  }
}
