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
      Navigator.pushReplacementNamed(
        context,
        HomeScreen.routeName,
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
                left: 80,
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
                      backgroundColor: Colors.white,
                      radius: 90,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      )
                      // Icon(
                      //   Icons.support_agent_sharp,
                      //   size: 65,
                      // ),
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
                    'Powered by :',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage('assets/images/ad_logo.jpg'),
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        'The Sparks Foundation',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
