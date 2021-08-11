import 'package:bank_app/screens/payment_screen.dart';
import 'package:bank_app/screens/splash_screen.dart';
import 'package:bank_app/screens/transaction_result_screen.dart';
import 'package:bank_app/screens/trasaction_history_screen.dart';
import 'package:bank_app/screens/user_detail_screen.dart';
import 'package:bank_app/screens/user_selection_screen.dart';
import 'package:flutter/material.dart';

import 'package:bank_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        PaymentScreen.routeName: (ctx) => PaymentScreen(),
        UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(),
        UserSelectionScreen.routeName: (ctx) => UserSelectionScreen(),
        TransactionResultScreen.routeName: (ctx) => TransactionResultScreen(),
        TransactionHistoryScreen.routeName: (ctx) => TransactionHistoryScreen(),
      },
    );
  }
}
