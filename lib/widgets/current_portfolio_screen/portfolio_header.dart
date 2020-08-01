import 'package:flutter/material.dart';

import '../../providers/current_portfolio.dart';

class PortfolioHeader extends StatelessWidget {
  final CurrentPortfolio portfolio;

  PortfolioHeader(this.portfolio);

  @override
  Widget build(BuildContext context) {
    const headerTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );

    return Row(
      children: <Widget>[
        Expanded(
          child: const Text(
            'Total Amount',
            style: headerTextStyle,
          ),
        ),
        Expanded(
          child: Text(
            portfolio.total.toStringAsFixed(2),
            textAlign: TextAlign.end,
            style: headerTextStyle,
          ),
        ),
      ],
    );
  }
}
