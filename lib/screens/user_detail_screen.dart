import 'package:bank_app/models/user.dart';
import 'package:bank_app/screens/user_selection_screen.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  static const routeName = 'user-detail';

  final String name;
  final String email;
  final double curBalance;
  UserDetailsScreen({
    required this.name,
    required this.email,
    required this.curBalance,
  });
  @override
  Widget build(BuildContext context) {
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
              color: Colors.white,
              height: 250,
              margin: EdgeInsets.all(30),
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
                        name,
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
                        email,
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
                        curBalance.toStringAsFixed(2),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => UserSelectionScreen(
                          User(
                            userName: name,
                            email: email,
                            balance: curBalance,
                          ),
                        ),
                      ),
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
