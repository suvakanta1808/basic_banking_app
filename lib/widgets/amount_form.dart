import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountForm extends StatelessWidget {
  final String receiver;

  AmountForm(this.receiver);

  final _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 230,
      ),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transfering to $receiver',
              style: TextStyle(fontFamily: 'Spartan'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.blue.shade800,
              ),
              child: TextField(
                style: TextStyle(color: Colors.white, fontFamily: 'Spartan'),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter amount',
                ),
                controller: _controller,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  color: Colors.amber,
                  child: Text('Pay'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
