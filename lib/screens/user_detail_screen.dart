import 'package:bank_app/models/user.dart';
import 'package:bank_app/screens/user_selection_screen.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  static const routeName = '/user-detail';

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        color: Colors.white24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade800),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              height: 350,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue.shade800,
                      child: Icon(
                        Icons.person,
                        size: 35,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.blue.shade800,
                    indent: 50,
                    endIndent: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Username:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        user.userName,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Spartan',
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blue.shade800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email Id:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Spartan',
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blue.shade800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Balance:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        user.balance.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Spartan',
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blue.shade800,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      UserSelectionScreen.routeName,
                      arguments: user,
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Transfer Money',
                        style: TextStyle(fontSize: 17),
                      )),
                  elevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
