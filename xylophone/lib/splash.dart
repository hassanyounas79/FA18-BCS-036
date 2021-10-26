import 'package:flutter/material.dart';
import 'package:xylophone/main.dart';

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
        context, MaterialPageRoute(builder: (context) => const ScreenOne()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: Center(
        child: Column(
          children: const [
            Spacer(),
            Image(
              alignment: Alignment.center,
              // height: 200,
              image: AssetImage("images/xylotext.png"),
            ),
            Image(
              height: 500,
              width: 400,
              image: AssetImage('images/splash.png'),
            ),
          ],
        ),
      ),
    );
  }
}
