import 'package:amot/widgets/add_expense_screen/split_method_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/partaker.dart';
import '../../providers/current_portfolio.dart';

class ExpenseForm extends StatefulWidget {
  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  List<Partaker> partakers = [];
  CurrentPortfolio portfolio;

  @override
  void didChangeDependencies() {
    if (portfolio == null) {
      portfolio = Provider.of<CurrentPortfolio>(context);
      partakers = [...portfolio.partakers];
    }
    super.didChangeDependencies();
  }

  void _setPartakers(List<Partaker> value) {
    setState(() {
      partakers = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          Expanded(
              child: SplitMethodInput(portfolio, partakers, _setPartakers)),
        ],
      ),
    );
  }
}
