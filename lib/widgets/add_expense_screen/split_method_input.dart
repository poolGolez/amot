import 'package:flutter/material.dart';

import '../../models/partaker.dart';
import '../../providers/current_portfolio.dart';

class SplitMethodInput extends FormField<List<Partaker>> {
  final CurrentPortfolio portfolio;
  static SplitMethod splitMethod = SplitMethod.EQUAL;

  SplitMethodInput(
    this.portfolio, {
    FormFieldSetter<List<Partaker>> onSaved,
    FormFieldValidator<List<Partaker>> validator,
    List<Partaker> initialValue = const <Partaker>[],
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (FormFieldState<List<Partaker>> state) {
            var context = state.context;
            var partakers = state.value;

            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.group, color: Theme.of(context).primaryColor),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'How to split expense?',
                          style: const TextStyle(fontSize: 18),
                        ),
                        if (state.errorText != null)
                          Text(
                            state.errorText,
                            style:
                                TextStyle(color: Theme.of(context).errorColor),
                          ),
                      ],
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
                          onChanged: (v) =>
                              state.didChange(portfolio.partakers),
                        ),
                        RadioListTile(
                          title: Text('Only the following people:'),
                          value: portfolio.partakers.length != partakers.length
                              ? SplitMethod.EQUAL
                              : SplitMethod.CUSTOM,
                          groupValue: splitMethod,
                          onChanged: (v) => state.didChange(<Partaker>[]),
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
                                  state.didChange(newPartakers);
                                },
                                title: Text(
                                  targetPartaker.name,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
          },
        );
}

enum SplitMethod { EQUAL, CUSTOM }
