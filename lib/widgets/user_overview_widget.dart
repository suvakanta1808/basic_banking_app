import 'dart:convert';

import 'package:bank_app/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOverviewWidget extends StatefulWidget {
  const UserOverviewWidget({Key? key}) : super(key: key);

  @override
  _UserOverviewWidgetState createState() => _UserOverviewWidgetState();
}

class _UserOverviewWidgetState extends State<UserOverviewWidget> {
  Map<String, dynamic> _userdata = {};
  var _isLoading = false;

  Future<void> _loadUserList() async {
    setState(() {
      _isLoading = true;
    });
    final pref = await SharedPreferences.getInstance();
    final userData = pref.getString('userList');
    final data = json.decode(userData.toString()) as Map<String, dynamic>;
    print(data);
    setState(() {
      _userdata = data;
      _isLoading = false;
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
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
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
                      var user = _userdata['data'];
                      return UserItem(
                        name: user[i]['name'],
                        email: user[i]['email'],
                        balance: user[i]['balance'],
                      );
                    },
                    itemCount: _userdata['data'].length,
                  ),
                ),
              ],
            ),
    );
  }
}
