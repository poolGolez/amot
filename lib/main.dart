import 'package:flutter/material.dart';

import './screens/money_pool_screen.dart';

void main() {
  runApp(AmotApp());
}

class AmotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amot',
      theme: ThemeData(primaryColor: Colors.teal),
      home: MoneyPoolScreen(),
    );
  }
}
