import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DummyData {
  Future<void> createDatabase() async {
    final pref = await SharedPreferences.getInstance();
    final userlist = json.encode(
      {
        'data': [
          {
            'name': 'Suryabeer Singh',
            'email': 'surya@gmail.com',
            'balance': 12370.70,
          },
          {
            'name': 'Gurpreet Singh',
            'email': 'gurpreet@gmail.com',
            'balance': 42300.00,
          },
          {
            'name': 'Ramnath Anand',
            'email': 'ramnath@gmail.com',
            'balance': 22495.60,
          },
          {
            'name': 'Viswanath Roy',
            'email': 'viswanath@gmail.com',
            'balance': 5000.00,
          },
        ],
      },
    );
    await pref.setString('userList', userlist);
  }
}
