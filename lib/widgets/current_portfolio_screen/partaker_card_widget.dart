import 'package:flutter/material.dart';

import './partaker_contribution_entry_widget.dart';
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
              PartakerContributionEntryWidget(widget.entry),
            ],
          ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: (Theme.of(context).primaryColor as MaterialColor)[500],
              width: 3,
            ),
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
                trailing: widget.entry.contributions.length == 0
                    ? SizedBox(
                        width: 25,
                      )
                    : _expanded
                        ? Icon(Icons.expand_less)
                        : Icon(Icons.expand_more),
                onTap: widget.entry.contributions.length == 0
                    ? null
                    : () => setState(() => _expanded = !_expanded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
