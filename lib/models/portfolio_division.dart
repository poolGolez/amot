import 'package:flutter/foundation.dart';

import './expense.dart';
import './partaker.dart';
import './portfolio.dart';

class PortfolioDivision {
  final List<PortfolioDivisionEntry> _entries = [];

  PortfolioDivision(Portfolio portfolio) {
    // TODO implementation
    final beer = Expense(name: 'beer', amount: 350.00);
    final pizza = Expense(name: 'pizza', amount: 1440.00);
    final sisig = Expense(name: 'sisig', amount: 250.00);
    final karaoke = Expense(name: 'karaoke', amount: 750.00);

    this._entries.addAll([
      PortfolioDivisionEntry(partaker: Partaker('Paul'), contributions: [
        ExpenseContributionEntry(expense: beer, amount: 87.5),
        ExpenseContributionEntry(expense: pizza, amount: 360.00),
      ]),
      PortfolioDivisionEntry(partaker: Partaker('Gid'), contributions: [
        ExpenseContributionEntry(expense: beer, amount: 87.5),
        ExpenseContributionEntry(expense: sisig, amount: 250.00),
        ExpenseContributionEntry(expense: pizza, amount: 360.00),
      ]),
      PortfolioDivisionEntry(partaker: Partaker('Chuckee'), contributions: [
        ExpenseContributionEntry(expense: beer, amount: 87.5),
        ExpenseContributionEntry(expense: pizza, amount: 360.00),
        ExpenseContributionEntry(expense: karaoke, amount: 750.00),
      ]),
      PortfolioDivisionEntry(partaker: Partaker('June'), contributions: [
        ExpenseContributionEntry(expense: beer, amount: 87.5),
        ExpenseContributionEntry(expense: pizza, amount: 360.00),
      ]),
    ]);
  }

  PortfolioDivisionEntry operator [](int index) => _entries[index];
  int get length => _entries.length;
}

class PortfolioDivisionEntry {
  final Partaker partaker;
  final List<ExpenseContributionEntry> contributions;

  PortfolioDivisionEntry({
    @required this.partaker,
    @required this.contributions,
  });

  double get amount =>
      contributions.fold(0, (sum, entry) => sum + entry.amount);
}

class ExpenseContributionEntry {
  final Expense expense;
  final double amount;

  ExpenseContributionEntry({
    @required this.expense,
    @required this.amount,
  });
}
