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
  List<ExpensePartakerEntry> _entries = [];

  Portfolio({
    @required this.title,
    this.transactionDate,
  }) {
    partakers = [
      Partaker('Pool'),
      Partaker('June'),
      Partaker('Gid'),
      Partaker('Chuckee'),
    ];
  }

  double get total => 15641.5;

  // TODO: implementation
  PortfolioDivision get division => PortfolioDivision(this);

  void splitExpense(Expense expense, List<Partaker> partakers) {
    this.expenses.add(expense);
    for (var partaker in partakers) {
      final entry = ExpensePartakerEntry(expense: expense, partaker: partaker);
      this._entries.add(entry);
    }
  }
}

class ExpensePartakerEntry {
  final Expense expense;
  final Partaker partaker;

  ExpensePartakerEntry({
    @required this.expense,
    @required this.partaker,
  });
}
