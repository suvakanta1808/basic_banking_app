import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String name;
  final String email;

  UserItem({
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.blue.shade300,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 30,
              ),
              radius: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right_rounded,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
