import 'package:flutter/material.dart';
import 'package:bank_app/helper/db_helper.dart';
import 'package:bank_app/models/user.dart';
import 'package:bank_app/screens/payment_screen.dart';

class UserSelectionScreen extends StatefulWidget {
  static const routeName = '/user-selection';

  @override
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  List<User> userList = [];
  var _isLoading = false;

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
    final user = ModalRoute.of(context)!.settings.arguments as User;

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
                  if (userList[i].userName != user.userName) {
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
                                var receiver = new User(
                                  userName: userList[i].userName,
                                  email: userList[i].email,
                                  balance: userList[i].balance,
                                );

                                Navigator.of(context).pushReplacementNamed(
                                  PaymentScreen.routeName,
                                  arguments: [
                                    user,
                                    receiver,
                                  ],
                                );
                              },
                              icon: Icon(Icons.radio_button_off),
                            ),
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
