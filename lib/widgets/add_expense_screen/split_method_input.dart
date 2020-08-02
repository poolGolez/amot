import 'package:flutter/material.dart';

import '../../models/partaker.dart';
import '../../providers/current_portfolio.dart';

class SplitMethodInput extends StatefulWidget {
  final CurrentPortfolio portfolio;
  final Function setPartakers;

  SplitMethodInput(this.portfolio, this.setPartakers);

  @override
  _SplitMethodInputState createState() => _SplitMethodInputState();
}

class _SplitMethodInputState extends State<SplitMethodInput> {
  SplitMethod splitMethod = SplitMethod.EQUAL;
  List<Partaker> partakers;

  @override
  void didChangeDependencies() {
    if (partakers == null) {
      partakers = this.widget.portfolio.partakers;
    }
    super.didChangeDependencies();
  }

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
                  value: widget.portfolio.partakers.length == partakers.length
                      ? SplitMethod.EQUAL
                      : SplitMethod.CUSTOM,
                  groupValue: splitMethod,
                  onChanged: (v) =>
                      setState(() => partakers = widget.portfolio.partakers),
                ),
                RadioListTile(
                  title: Text('Only the following people:'),
                  value: widget.portfolio.partakers.length != partakers.length
                      ? SplitMethod.EQUAL
                      : SplitMethod.CUSTOM,
                  groupValue: splitMethod,
                  onChanged: (v) => setState(() => partakers = <Partaker>[]),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 50),
                    itemCount: widget.portfolio.partakers.length,
                    itemBuilder: (ctx, index) {
                      final targetPartaker = widget.portfolio.partakers[index];
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
                          setState(() {
                            partakers = newPartakers;
                          });
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
