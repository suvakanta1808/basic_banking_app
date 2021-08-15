import 'dart:async';

import 'package:bank_app/helper/db_helper.dart';
import 'package:bank_app/models/transfer.dart';
import 'package:bank_app/models/user.dart';
import 'package:bank_app/screens/transaction_result_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '\payment';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _amountController = new TextEditingController();
  var _isInProgress = false;

  Future<void> updateHandler(
      User sender, User receiver, Transfer transfer) async {
    await DBHelper().updateUserTable(sender, receiver);

    await DBHelper().updateTransfersTable(transfer);
  }

  Timer _startTimer() {
    setState(() {
      _isInProgress = true;
    });
    var timer = new Timer(
      Duration(seconds: 3),
      () {
        setState(() {
          _isInProgress = false;
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.of(context)
              .pushReplacementNamed(TransactionResultScreen.routeName);
        });
      },
    );
    return timer;
  }

  @override
  Widget build(BuildContext context) {
    final dataList = ModalRoute.of(context)!.settings.arguments as List<User>;
    final sender = dataList[0];
    final receiver = dataList[1];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 35,
                  left: 10,
                ),
                child: Row(
                  children: [
                    Icon(Icons.animation),
                    Text('Processing your transaction...'),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                  top: 160,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 35,
                          ),
                        ),
                        Icon(
                          Icons.fast_forward_sharp,
                          size: 12,
                        ),
                        CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Payment from ${sender.userName} to ${receiver.userName}',
                      style: TextStyle(fontSize: 15, fontFamily: 'Spartan'),
                    ),
                    Text(
                      'through basic banking system',
                      style: TextStyle(fontSize: 15, fontFamily: 'Spartan'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Spartan'),
                            keyboardType: TextInputType.number,
                            controller: _amountController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RaisedButton(
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: () async {
                        if (_amountController.text.isEmpty ||
                            double.parse(_amountController.text) <= 0.0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Amount field can not be empty or must be greter than 0.0'),
                            ),
                          );
                        } else {
                          var sendingUser = User(
                            userName: sender.userName,
                            email: sender.email,
                            balance: sender.balance -
                                double.parse(_amountController.text),
                          );

                          var receivingUser = User(
                            userName: receiver.userName,
                            email: receiver.email,
                            balance: receiver.balance +
                                double.parse(_amountController.text),
                          );

                          var transfer = Transfer(
                            id: DateTime.now().toString(),
                            sender: sender.userName,
                            receiver: receiver.userName,
                            amount: double.parse(_amountController.text),
                            status: 'Success',
                          );

                          await updateHandler(
                                  sendingUser, receivingUser, transfer)
                              .then((value) {
                            _startTimer();
                          });
                        }
                      },
                      color: Colors.amber,
                      child: Text(
                        _isInProgress ? 'Transfering...Please Wait.' : 'Pay',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Secured By',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/bank.png'),
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          'The Shark Industries',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
