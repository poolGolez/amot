import 'package:flutter/material.dart';

import '../widgets/add_expense_screen/expense_form.dart';

class AddExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add expense'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: ExpenseForm(),
      ),
    );
  }
}
