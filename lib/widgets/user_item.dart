import 'package:bank_app/models/user.dart';
import 'package:bank_app/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String name;
  final String email;
  final double balance;

  UserItem({
    required this.name,
    required this.email,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    var user = User(
      userName: name,
      email: email,
      balance: balance,
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      margin: EdgeInsets.only(
        bottom: 10,
        left: 8,
        right: 8,
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 20,
              ),
              radius: 20,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 120,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  child: Text(
                    email,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Spartan',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 60,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(UserDetailsScreen.routeName, arguments: user);
              },
              icon: Icon(
                Icons.chevron_right_rounded,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
