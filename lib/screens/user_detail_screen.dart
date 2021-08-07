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
        title: Text('User Details'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(25),
            bottomEnd: Radius.circular(25),
          ),
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 65,
                    color: Colors.blue.shade700,
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: 180,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Email-ID:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Account Balance:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$curBalance',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(
                  elevation: 5,
                  color: Colors.white38,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => UserSelectionScreen(User(
                          userName: name,
                          email: email,
                          balance: curBalance,
                        )),
                      ),
                    );
                  },
                  child: Text(
                    'Transfer Money',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
