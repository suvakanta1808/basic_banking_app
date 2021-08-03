import 'package:bank_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

import 'package:bank_app/widgets/user_overview_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    DummyData().createDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Bank'),
      ),
      body: UserOverviewWidget(),
    );
  }
}
