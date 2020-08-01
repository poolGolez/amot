import 'package:amot/widgets/current_portfolio_screen/partaker_card_widget.dart';
import 'package:flutter/material.dart';

import '../../models/portfolio_division.dart';

class PortfolioDivisionWidget extends StatelessWidget {
  final PortfolioDivision division;

  const PortfolioDivisionWidget(this.division);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx, index) => PartakerCardWidget(division[index]),
      itemCount: division.length,
    );
  }
}
