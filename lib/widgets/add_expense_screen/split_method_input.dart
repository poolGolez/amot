import 'package:amot/providers/current_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplitMethodInput extends StatefulWidget {
  @override
  SplitMethodInputState createState() => SplitMethodInputState();
}

class SplitMethodInputState extends State<SplitMethodInput> {
  String x;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8),
          width: double.infinity,
          child: Text(
            'How to split expense?',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        RadioListTile(
          title: Text('Split evenly'),
          value: 'Split',
          groupValue: x,
          onChanged: (v) {
            setState(() => x = v);
          },
        ),
        Column(
          children: [
            RadioListTile(
              title: Text('Only the following:'),
              value: 'Selected',
              groupValue: x,
              onChanged: (v) {
                setState(() => x = v);
              },
            ),
            Consumer<CurrentPortfolio>(
              builder: (ctx, portfolio, child) {
                print("PARTAKERS ${portfolio.partakers}");
                return Column(
                  children: portfolio.partakers.map(
                    (partaker) {
                      return CheckboxListTile(
                        dense: true,
                        value: true,
                        onChanged: null,
                        title: Text(
                          partaker.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ).toList(),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
