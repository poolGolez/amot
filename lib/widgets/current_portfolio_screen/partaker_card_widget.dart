import 'package:flutter/material.dart';

import '../../models/portfolio_division.dart';

class PartakerCardWidget extends StatefulWidget {
  final PortfolioDivisionEntry entry;

  const PartakerCardWidget(this.entry);

  @override
  _PartakerCardWidgetState createState() => _PartakerCardWidgetState();
}

class _PartakerCardWidgetState extends State<PartakerCardWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(fontSize: 18);
    return Stack(
      children: <Widget>[
        if (_expanded)
          Column(
            children: <Widget>[
              SizedBox(height: 35),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 55, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 15),
                      ...widget.entry.contributions
                          .map((e) => Container(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10)), //.circular(10),
                  side: BorderSide(color: Colors.teal[200], width: 3),
                ),
              ),
            ],
          ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: (Theme.of(context).primaryColor as MaterialColor)[500],
                width: 3),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.entry.partaker.name,
                            style: textStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          widget.entry.amount.toStringAsFixed(2),
                          style: textStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: _expanded
                    ? Icon(Icons.expand_less)
                    : Icon(Icons.expand_more),
                onTap: () => setState(() => _expanded = !_expanded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
