import 'package:flutter/foundation.dart';

import '../models/expense.dart';
import '../models/partaker.dart';
import '../models/portfolio.dart';
import '../models/portfolio_division.dart';

class CurrentPortfolio with ChangeNotifier {
  Portfolio portfolio;

  CurrentPortfolio() {
    final partakers = [
      Partaker('Pool'),
      Partaker('June'),
      Partaker('Gid'),
      Partaker('Chuckee'),
    ];
    portfolio = Portfolio(
      title: 'Samgyupsal on the Moon',
      partakers: partakers,
    );
  }

  String get title => portfolio.title;
  List<Partaker> get partakers => portfolio.partakers;
  double get total => portfolio.total;
  PortfolioDivision get division => portfolio.division;

  void splitExpense(Expense expense, List<Partaker> partakers) {
    portfolio.splitExpense(expense, partakers);
    notifyListeners();
  }
}
