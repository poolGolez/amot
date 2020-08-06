import 'package:flutter/material.dart';

import '../../models/portfolio_division.dart';

class PartakerContributionEntryWidget extends StatelessWidget {
  final PortfolioDivisionEntry entry;

  PartakerContributionEntryWidget(this.entry);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen[50],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 55, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15),
            ...entry.contributions
                .map((e) => Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(e.expense.name),
                          Text(e.amount.toStringAsFixed(2)),
                        ],
                      ),
                    ))
                .toList()
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        side: BorderSide(color: Colors.teal[200], width: 3),
      ),
    );
  }
}
