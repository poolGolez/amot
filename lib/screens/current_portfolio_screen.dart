import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../providers/current_portfolio.dart';
import '../screens/add_expense_screen.dart';
import '../widgets/current_portfolio_screen/portfolio_division_widget.dart';
import '../widgets/current_portfolio_screen/portfolio_expenses_widget.dart';
import '../widgets/current_portfolio_screen/portfolio_header.dart';
import 'add_partaker_screen.dart';

enum PortfolioView { PARTAKER, EXPENSE }

class CurrentPortfolioScreen extends StatefulWidget {
  @override
  _CurrentPortfolioScreenState createState() => _CurrentPortfolioScreenState();
}

class _CurrentPortfolioScreenState extends State<CurrentPortfolioScreen> {
  PortfolioView view = PortfolioView.PARTAKER;

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
        color: (Theme.of(context).primaryColor as MaterialColor)[50],
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(right: 5.0),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: view == PortfolioView.PARTAKER
                                ? null
                                : () => setState(
                                    () => view = PortfolioView.PARTAKER),
                            child: Text('Partakers'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5)),
                            ),
                            elevation: 10,
                            color: Colors.white,
                            textColor: Theme.of(context).primaryColor,
                            disabledElevation: 0,
                            disabledColor: Theme.of(context).primaryColor,
                            disabledTextColor: Colors.white,
                          ),
                          RaisedButton(
                            onPressed: view == PortfolioView.EXPENSE
                                ? null
                                : () => setState(
                                    () => view = PortfolioView.EXPENSE),
                            child: Text('Expenses'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(5)),
                            ),
                            elevation: 6,
                            color: Colors.white,
                            textColor: Theme.of(context).primaryColor,
                            disabledElevation: 0,
                            disabledColor: Theme.of(context).primaryColor,
                            disabledTextColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: view == PortfolioView.PARTAKER
                          ? PortfolioDivisionWidget(portfolio.division)
                          : PortfolioExpensesWidget(
                              portfolio.expenseAllocation),
                    ),
                  ],
                ),
              ),
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
            label: "Expense",
            onTap: () => promptAddExpenseDialog(context),
          ),
          SpeedDialChild(
            backgroundColor: Theme.of(context).accentColor,
            label: "Participant",
            child: Icon(Icons.person),
            onTap: () => promptAddPartakerDialog(context),
          )
        ],
      ),
    );
  }

  void promptAddExpenseDialog(ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => AddExpenseScreen(),
      ),
    );
  }

  void promptAddPartakerDialog(ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => AddPartakerScreen(),
      ),
    );
  }
}
