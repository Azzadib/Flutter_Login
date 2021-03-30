import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pemula/login.dart';
import 'package:flutter_pemula/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginPage.routeName: (context) => LoginPage(),
        MainScreen.routeName: (context) => MainScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async{
    var _duration = Duration(seconds: 8);
    return Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Tween _animationTween = Tween<double>(begin: 0, end: pi * 4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TweenAnimationBuilder<double>(
                tween: _animationTween,
                duration: Duration(seconds: 4),
                builder: (context, double value, child) {
                  return Transform.rotate(
                    angle: value,
                    child: FlutterLogo(
                      size: 100,
                      style: FlutterLogoStyle.markOnly,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text('Opening Submission App')
            ],
          ),
        ),
      ),
    );
  }
}
