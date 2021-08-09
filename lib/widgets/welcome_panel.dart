import 'package:flutter/material.dart';

class WelcomePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Color.lerp(Colors.blue.shade400, Colors.blue.shade800, 0.7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Home 🏠',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto Condensed',
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.account_circle,
                    size: 35,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Welcome to \'Basic Banking App\'',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto Condensed',
              ),
            ),
            Text(
              'A whole new digital world.',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Roboto Condensed',
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
