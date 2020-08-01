import 'package:flutter/material.dart';

import '../../models/portfolio_division.dart';

class PortfolioDivisionWidget extends StatelessWidget {
  final PortfolioDivision division;

  const PortfolioDivisionWidget(this.division);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx, index) {
        final entry = division[index];
        return Card(
          child: ListTile(
            title: Text(entry.partaker.name),
            trailing: Text(entry.amount.toStringAsFixed(2)),
          ),
        );
      },
      itemCount: division.length,
    );
  }
}
