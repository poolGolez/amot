import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/current_portfolio.dart';

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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: const Text(
                      'Total Amount',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      portfolio.total.toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemBuilder: (ctx, index) => Card(
                  child: ListTile(
                    title: Text('Paul'),
                  ),
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.attach_money),
        onPressed: null,
      ),
    );
  }
}
