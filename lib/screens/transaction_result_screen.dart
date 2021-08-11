import 'package:bank_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TransactionResultScreen extends StatelessWidget {
  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.home_rounded,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 160,
              ),
              padding: EdgeInsets.all(60),
              height: 230,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(130),
                border: Border.all(
                  color: Colors.green.shade700,
                  width: 14,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '✔',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    'Transaction Successful.',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton.icon(
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Return to Home',
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
