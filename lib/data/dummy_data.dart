import 'package:bank_app/models/user.dart';

class DummyData {
  List<User> _userData = [
    User(
      userName: 'Suryabeer Singh',
      email: 'surya@gmail.com',
      balance: 12475.00,
    ),
    User(
      userName: 'Amit Vansal',
      email: 'amit@gmail.com',
      balance: 10360.00,
    ),
    User(
      userName: 'Ajit Thakur',
      email: 'ajit@gmail.com',
      balance: 5670.00,
    ),
    User(
      userName: 'Priya Patnaik',
      email: 'priya@gmail.com',
      balance: 22400.00,
    ),
    User(
      userName: 'Komlpreet Roy',
      email: 'komlpreet@gmail.com',
      balance: 1200.00,
    ),
    User(
      userName: 'Jeet Patel',
      email: 'jeet@gmail.com',
      balance: 17840.00,
    ),
    User(
      userName: 'Ganesh Sahoo',
      email: 'ganesh@gmail.com',
      balance: 15390.00,
    ),
    User(
      userName: 'Rahul Roy',
      email: 'rahul@gmail.com',
      balance: 32000.00,
    ),
    User(
      userName: 'Anil Kumar',
      email: 'anil@gmail.com',
      balance: 42000.00,
    ),
    User(
      userName: 'Jagjeet Singh',
      email: 'jagjeet@gmail.com',
      balance: 60240.00,
    ),
  ];

  List<User> get userdata {
    return [..._userData];
  }
}
