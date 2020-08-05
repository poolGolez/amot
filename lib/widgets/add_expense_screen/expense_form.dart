import 'package:amot/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/partaker.dart';
import '../../providers/current_portfolio.dart';
import '../../widgets/add_expense_screen/split_method_input.dart';

class ExpenseForm extends StatefulWidget {
  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final formKey = GlobalKey<FormState>();

  String _name;
  double _amount;
  List<Partaker> _partakers;
  CurrentPortfolio portfolio;

  @override
  void didChangeDependencies() {
    if (portfolio == null) {
      portfolio = Provider.of<CurrentPortfolio>(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Amount*',
              icon: Icon(Icons.attach_money,
                  color: Theme.of(context).primaryColor),
            ),
            keyboardType: TextInputType.number,
            onSaved: (value) => _amount = double.parse(value),
            validator: (value) {
              if (value == null || value.trim().length == 0) {
                return 'Amount is required';
              }

              if (double.tryParse(value) == null) {
                return 'Invalid amount';
              }

              if (double.parse(value) <= 0) {
                return 'Amount should be more than zero';
              }

              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              icon: Icon(Icons.label, color: Theme.of(context).primaryColor),
            ),
            onSaved: (value) => _name = value,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SplitMethodInput(
                portfolio,
                initialValue: portfolio.partakers,
                onSaved: (value) => _partakers = value,
                validator: (value) {
                  if (value.length == 0) {
                    return 'Select at least one partaker for the expense';
                  }

                  return null;
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textColor: Colors.white,
              child: Text('Record Expense'),
              onPressed: () => saveForm(context),
            ),
          )
        ],
      ),
    );
  }

  void saveForm(BuildContext ctx) {
    if (!formKey.currentState.validate()) {
      return;
    }

    formKey.currentState.save();
    final expense = Expense(name: _name, amount: _amount);
    portfolio.splitExpense(expense, _partakers);

    Navigator.of(context).pop();
  }
}
