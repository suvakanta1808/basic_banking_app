import 'package:bank_app/screens/trasaction_history_screen.dart';
import 'package:flutter/material.dart';

class ServicePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(
        top: 145,
        left: 50,
        right: 50,
      ),
      child: Container(
        height: 115,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('Services'),
              margin: EdgeInsets.only(
                top: 10,
                left: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade800,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Account',
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade800,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.account_balance_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Balance'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade800,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => TransactionHistoryScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.history_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('History'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
