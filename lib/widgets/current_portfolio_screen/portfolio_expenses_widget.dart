import 'package:amot/models/portfolio.dart';
import 'package:flutter/material.dart';

class PortfolioExpensesWidget extends StatelessWidget {
  final List<ExpenseAllotmentPlan> expenseAllocation;

  PortfolioExpensesWidget(this.expenseAllocation);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final allocation = expenseAllocation[index];
          return Card(
            child: ListTile(
              title: Text(allocation.expense.name),
              trailing: Text(allocation.expense.amount.toStringAsFixed(2)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: (Theme.of(context).primaryColor as MaterialColor)[500],
                width: 3,
              ),
            ),
          );
        },
        itemCount: expenseAllocation.length);
  }
}
