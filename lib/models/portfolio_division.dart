import 'package:flutter/foundation.dart';

import './expense.dart';
import './partaker.dart';
import './portfolio.dart';

class PortfolioDivision {
  List<PortfolioDivisionEntry> _entries = [];

  PortfolioDivision(Portfolio portfolio) {
    _entries = portfolio.partakers
        .map((partaker) => PortfolioDivisionEntry(partaker))
        .toList();

    for (final plan in portfolio.expenseAllotmentPlans) {
      final expense = plan.expense;
      final amount = expense.amount / plan.partakers.length;
      for (final partaker in plan.partakers) {
        final entry = _entries.firstWhere((e) => e.partaker == partaker);
        entry.contribute(expense, amount);
      }
    }
  }

  PortfolioDivisionEntry operator [](int index) => _entries[index];
  int get length => _entries.length;
}

class PortfolioDivisionEntry {
  final Partaker partaker;
  final List<ExpenseContributionEntry> contributions = [];

  PortfolioDivisionEntry(this.partaker);

  double get amount =>
      contributions.fold(0, (sum, entry) => sum + entry.amount);

  void contribute(Expense expense, double amount) {
    this
        .contributions
        .add(ExpenseContributionEntry(expense: expense, amount: amount));
  }
}

class ExpenseContributionEntry {
  final Expense expense;
  final double amount;

  ExpenseContributionEntry({
    @required this.expense,
    @required this.amount,
  });
}
