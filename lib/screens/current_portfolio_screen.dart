import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/current_portfolio.dart';
import '../widgets/current_portfolio_screen/portfolio_division_widget.dart';
import '../widgets/current_portfolio_screen/portfolio_header.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CurrentPortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final portfolio = Provider.of<CurrentPortfolio>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(portfolio.title),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: (Theme.of(context).primaryColor as MaterialColor)[100],
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: PortfolioHeader(portfolio),
            ),
            Expanded(
              child: PortfolioDivisionWidget(portfolio.division),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
        children: <SpeedDialChild>[
          SpeedDialChild(
            backgroundColor: Theme.of(context).accentColor,
            child: Icon(Icons.receipt),
          ),
          SpeedDialChild(
            backgroundColor: Theme.of(context).accentColor,
            child: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
