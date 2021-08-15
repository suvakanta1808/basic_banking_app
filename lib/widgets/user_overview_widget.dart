import 'package:bank_app/helper/db_helper.dart';
import 'package:bank_app/models/user.dart';
import 'package:bank_app/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UserOverviewWidget extends StatefulWidget {
  const UserOverviewWidget({Key? key}) : super(key: key);

  @override
  _UserOverviewWidgetState createState() => _UserOverviewWidgetState();
}

class _UserOverviewWidgetState extends State<UserOverviewWidget> {
  List<User> userList = [];

  Future<void> _loadUserList() async {
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.blue.shade700,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Contacts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 8,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 305,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                print(userList);
                return UserItem(
                  name: userList[i].userName,
                  email: userList[i].email,
                  balance: userList[i].balance,
                );
              },
              itemCount: userList.length,
            ),
          ),
        ],
      ),
    );
  }
}
