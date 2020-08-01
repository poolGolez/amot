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
}
