import 'package:flutter/foundation.dart';

import './expense.dart';
import './partaker.dart';
import './portfolio_division.dart';

class Portfolio {
  String title;
  DateTime transactionDate = DateTime.now();
  DateTime dateCreated = DateTime.now();
  List<Partaker> partakers = [];
  List<Expense> expenses = [];
  List<ExpenseAllotmentPlan> expenseAllotmentPlans = [];

  Portfolio({@required this.title, this.transactionDate, this.partakers});

  double get total =>
      expenses.fold(0, (total, expense) => total + expense.amount);

  List<ExpenseAllotmentPlan> get expenseAllocation =>
      [...expenseAllotmentPlans];

  // TODO: implementation
  PortfolioDivision get division => PortfolioDivision(this);

  void splitExpense(Expense expense, List<Partaker> partakers) {
    this.expenses.add(expense);

    final plan = ExpenseAllotmentPlan(expense: expense, partakers: partakers);
    this.expenseAllotmentPlans.add(plan);
  }
}

class ExpenseAllotmentPlan {
  final Expense expense;
  final List<Partaker> partakers;

  ExpenseAllotmentPlan({
    @required this.expense,
    @required this.partakers,
  });
}
