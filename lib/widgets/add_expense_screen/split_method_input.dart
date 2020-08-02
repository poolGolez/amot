import 'package:flutter/material.dart';

import '../../models/partaker.dart';
import '../../providers/current_portfolio.dart';

class SplitMethodInput extends StatelessWidget {
  SplitMethod splitMethod = SplitMethod.EQUAL;

  CurrentPortfolio portfolio;
  List<Partaker> partakers;
  Function setPartakers;

  SplitMethodInput(this.portfolio, this.partakers, this.setPartakers);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.group, color: Theme.of(context).primaryColor),
            SizedBox(width: 15),
            Text(
              'How to split expense?',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: <Widget>[
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum SplitMethod { EQUAL, CUSTOM }
