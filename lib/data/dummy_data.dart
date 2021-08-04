import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DummyData {
  void createDatabase() async {
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
          {
            'name': 'Iqbal Singh',
            'email': 'iqbal@gmail.com',
            'balance': 10000.70,
          },
          {
            'name': 'Suryakumar panda',
            'email': 'suryakumar@gmail.com',
            'balance': 12370.70,
          },
          {
            'name': 'Anuj Pandey',
            'email': 'anuj@gmail.com',
            'balance': 52000.70,
          },
          {
            'name': 'Ankita Nayak',
            'email': 'ankita@gmail.com',
            'balance': 100370.70,
          },
          {
            'name': 'Binay Kaml',
            'email': 'binay@gmail.com',
            'balance': 17700.00,
          },
          {
            'name': 'Saina Talpade',
            'email': 'saina@gmail.com',
            'balance': 1500000.70,
          },
        ],
      },
    );
    await pref.setString('userList', userlist);
  }
}
