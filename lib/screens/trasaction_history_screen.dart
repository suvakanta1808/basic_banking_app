import 'package:bank_app/helper/db_helper.dart';
import 'package:bank_app/models/transfer.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  List<Transfer> _transactions = [];
  var _isLoading = false;

  loadTransactionHistory() async {
    setState(() {
      _isLoading = true;
    });
    final db = await DBHelper().dataBase;
    final res = await db.query('Transfers');
    List<Transfer> fetchedList = [];
    res.forEach((tr) {
      fetchedList.add(
        Transfer(
          id: '${tr['id']}',
          sender: '${tr['sender']}',
          receiver: '${tr['receiver']}',
          amount: double.parse(tr['amount'].toString()),
          status: '${tr['status']}',
        ),
      );
    });
    setState(() {
      _isLoading = false;
      _transactions = fetchedList;
    });
  }

  @override
  void initState() {
    loadTransactionHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('From'),
                        Text('To'),
                        Text('Amount'),
                        Text('Status'),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 120,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_transactions[i].sender),
                            Text(_transactions[i].receiver),
                            Text(_transactions[i].amount.toString()),
                            Text(_transactions[i].status),
                          ],
                        ),
                      ),
                      itemCount: _transactions.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
