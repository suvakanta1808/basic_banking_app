import 'dart:async';

import 'package:bank_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Timer startTimer() {
    return Timer(Duration(seconds: 4), () {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'Loading....',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              margin: EdgeInsets.only(
                top: 60,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 100,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: Icon(
                      Icons.support_agent_sharp,
                      size: 65,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\"A whole new digital world\"',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 150,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Designed by :',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Suvakanta Mohapatra',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
