import 'package:amot/models/partaker.dart';
import 'package:amot/models/portfolio.dart';
import 'package:amot/providers/current_portfolio.dart';
import 'package:flutter/material.dart';

class SplitMethodInput extends StatelessWidget {
  SplitMethod splitMethod = SplitMethod.EQUAL;

  CurrentPortfolio portfolio;
  List<Partaker> partakers;
  Function setPartakers;

  SplitMethodInput(this.portfolio, this.partakers, this.setPartakers);

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
          value: portfolio.partakers.length == partakers.length
              ? SplitMethod.EQUAL
              : SplitMethod.CUSTOM,
          groupValue: splitMethod,
          onChanged: (v) => setPartakers(portfolio.partakers),
        ),
        RadioListTile(
          title: Text('Only the following people:'),
          value: portfolio.partakers.length != partakers.length
              ? SplitMethod.EQUAL
              : SplitMethod.CUSTOM,
          groupValue: splitMethod,
          onChanged: (v) => setPartakers(<Partaker>[]),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(left: 50),
            itemCount: portfolio.partakers.length,
            itemBuilder: (ctx, index) {
              final targetPartaker = portfolio.partakers[index];
              return CheckboxListTile(
                dense: true,
                value: partakers.contains(targetPartaker),
                onChanged: (selected) {
                  final newPartakers = [...partakers];
                  if (selected) {
                    newPartakers.add(targetPartaker);
                  } else {
                    newPartakers.remove(targetPartaker);
                  }
                  setPartakers(newPartakers);
                },
                title: Text(
                  targetPartaker.name,
                  style: const TextStyle(fontSize: 18),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              );
            },
          ),
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textColor: Colors.white,
            child: Text('Record Expense'),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

enum SplitMethod { EQUAL, CUSTOM }
