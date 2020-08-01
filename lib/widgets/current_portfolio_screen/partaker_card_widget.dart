import 'package:flutter/material.dart';

import '../../models/portfolio_division.dart';

class PartakerCardWidget extends StatelessWidget {
  final PortfolioDivisionEntry entry;

  const PartakerCardWidget(this.entry);

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(fontSize: 18);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.teal[300], width: 3)),
      child: ListTile(
        title: Text(
          entry.partaker.name,
          style: textStyle,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          entry.amount.toStringAsFixed(2),
          style: textStyle,
        ),
      ),
    );
  }
}
