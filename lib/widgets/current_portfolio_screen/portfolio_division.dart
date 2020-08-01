import 'package:flutter/material.dart';

import '../../providers/current_portfolio.dart';

class PortfolioDivision extends StatelessWidget {
  final CurrentPortfolio portfolio;

  const PortfolioDivision(this.portfolio);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx, index) => Card(
        child: ListTile(
          title: Text('Paul'),
        ),
      ),
      itemCount: 4,
    );
  }
}
