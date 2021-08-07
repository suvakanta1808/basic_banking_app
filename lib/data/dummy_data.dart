import 'package:bank_app/models/user.dart';

class DummyData {
  List<User> _userData = [
    User(
      userName: 'Surya Singh',
      email: 'surya@gmail.com',
      balance: 12475.00,
    ),
    User(
      userName: 'Amit Singh',
      email: 'amit@gmail.com',
      balance: 12475.00,
    ),
    User(
      userName: 'Ajit Singh',
      email: 'ajit@gmail.com',
      balance: 12475.00,
    ),
    User(
      userName: 'Priya Singh',
      email: 'priya@gmail.com',
      balance: 12475.00,
    ),
    User(
      userName: 'Arya Singh',
      email: 'arya@gmail.com',
      balance: 12475.00,
    ),
  ];

  List<User> get userdata {
    return [..._userData];
  }
}
