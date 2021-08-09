import 'package:bank_app/models/transfer.dart';
import 'package:flutter/material.dart';

class TransactionHistoryItem extends StatelessWidget {
  final Transfer tr;

  TransactionHistoryItem(this.tr);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 16) / 4,
                child: Text(
                  tr.sender,
                  style: TextStyle(
                    fontFamily: 'Spartan',
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 16) / 4,
                child: Text(
                  tr.receiver,
                  style: TextStyle(
                    fontFamily: 'Spartan',
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 16) / 4,
                child: Text(
                  tr.amount.toString(),
                  style: TextStyle(
                    fontFamily: 'Spartan',
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 16) / 4,
                child: Text(
                  tr.status,
                  style: TextStyle(
                    fontFamily: 'Spartan',
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
