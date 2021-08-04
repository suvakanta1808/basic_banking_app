import 'package:bank_app/widgets/service_panel.dart';
import 'package:bank_app/widgets/welcome_panel.dart';
import 'package:flutter/material.dart';

import 'package:bank_app/data/dummy_data.dart';
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
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                WelcomePanel(),
                SizedBox(
                  height: 60,
                ),
                UserOverviewWidget(),
              ],
            ),
          ),
          ServicePanel(),
        ],
      ),
    );
  }
}
