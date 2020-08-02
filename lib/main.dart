import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/current_portfolio.dart';
import './screens/current_portfolio_screen.dart';

void main() {
  runApp(AmotApp());
}

class AmotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentPortfolio()),
      ],
      child: MaterialApp(
        title: 'Amot',
        theme: ThemeData(
            primaryColor: Colors.teal,
            accentColor: Colors.deepPurple,
            buttonColor: Colors.teal,
            textTheme: TextTheme(
              button: TextStyle(fontSize: 18),
            )),
        home: CurrentPortfolioScreen(),
      ),
    );
  }
}
