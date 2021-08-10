import 'package:bank_app/helper/db_helper.dart';
import 'package:bank_app/models/transfer.dart';
import 'package:bank_app/widgets/transaction_history_item.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  static const routeName = '/history';
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
        backgroundColor: Colors.amber,
        title: Text('Transaction History'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _isLoading
            ? Center(
                child: Text('Loading...'),
              )
            : Column(
                children: [
                  Container(
                    color: Colors.blue.shade400,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 7,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width - 16) / 4,
                          child: Text(
                            'From',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width - 16) / 4,
                          child: Text(
                            'To',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width - 16) / 4,
                          child: Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width - 16) / 4,
                          child: Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 130,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) =>
                          TransactionHistoryItem(_transactions[i]),
                      itemCount: _transactions.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
