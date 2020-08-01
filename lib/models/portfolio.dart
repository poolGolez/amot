import 'package:amot/models/partaker.dart';
import 'package:flutter/foundation.dart';

import 'expense.dart';

class Portfolio {
  String title;
  DateTime transactionDate;
  DateTime dateCreated;
  List<Partaker> partakers = [];
  List<Expense> expenses = [];

  Portfolio({
    @required this.title,
    this.transactionDate,
  }) {
    if (this.transactionDate == null) {
      this.transactionDate = DateTime.now();
    }
    this.dateCreated = DateTime.now();
  }

  double get total => 15641.5;
}
