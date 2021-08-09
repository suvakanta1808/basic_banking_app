import 'package:bank_app/helper/db_helper.dart';
import 'package:bank_app/models/transfer.dart';
import 'package:bank_app/models/user.dart';
import 'package:bank_app/screens/transaction_result_screen.dart';
import 'package:flutter/material.dart';

class UserSelectionScreen extends StatefulWidget {
  final User sender;

  UserSelectionScreen(this.sender);

  @override
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  List<User> userList = [];
  var _isLoading = false;

  Future<void> updateHandler(
      User sender, User receiver, Transfer transfer) async {
    await DBHelper().updateUserTable(sender, receiver);

    await DBHelper().updateTransfersTable(transfer);
  }

  Future<void> _loadUserList() async {
    setState(() {
      _isLoading = true;
    });
    await DBHelper().dataBase.then((db) async {
      final res = await db.query('User');
      List<User> userData = [];
      res.forEach((user) {
        userData.add(User(
          userName: '${user['name']}',
          email: '${user['email']}',
          balance: double.parse(user['balance'].toString()),
        ));
      });
      setState(() {
        userList = userData;
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserList();
  }

  @override
  Widget build(BuildContext context) {
    final _amountController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select User'),
      ),
      body: _isLoading
          ? Center(
              child: Text('Loading...'),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  if (userList[i].userName != widget.sender.userName) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userList[i].userName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  userList[i].email,
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: ctx,
                                    builder: (ctx) => AlertDialog(
                                      title: Text('Enter the amount'),
                                      content: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: _amountController,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            if (_amountController
                                                    .text.isEmpty ||
                                                double.parse(_amountController
                                                        .text) <=
                                                    0.0) {
                                              ScaffoldMessenger.of(ctx)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Amount field can not be empty or must be greter than 0.0'),
                                                ),
                                              );
                                            } else {
                                              var receiver = new User(
                                                userName: userList[i].userName,
                                                email: userList[i].email,
                                                balance: userList[i].balance +
                                                    double.parse(
                                                        _amountController.text),
                                              );
                                              var sender = new User(
                                                userName:
                                                    widget.sender.userName,
                                                email: widget.sender.email,
                                                balance: widget.sender.balance -
                                                    double.parse(
                                                        _amountController.text),
                                              );

                                              var transfer = new Transfer(
                                                id: DateTime.now().toString(),
                                                sender: sender.userName,
                                                receiver: receiver.userName,
                                                amount: double.parse(
                                                    _amountController.text),
                                                status: 'Success',
                                              );
                                              await updateHandler(sender,
                                                      receiver, transfer)
                                                  .then((value) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (c) =>
                                                            TransactionResultScreen()));
                                              });
                                            }
                                          },
                                          child: Text('CONFIRM'),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(Icons.radio_button_off))
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Spacer(); // to avoid transfering into own account..
                  }
                },
                itemCount: userList.length,
              ),
            ),
    );
  }
}
