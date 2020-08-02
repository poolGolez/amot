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

    final beer = Expense(name: 'beer', amount: 350.00);
    final pizza = Expense(name: 'pizza', amount: 800.00);
    final sisig = Expense(name: 'sisig', amount: 600.00);
    final karaoke = Expense(name: 'karaoke', amount: 750.00);

    portfolio.splitExpense(beer, partakers);
    portfolio.splitExpense(pizza, [partakers[0], partakers[1], partakers[2]]);
    portfolio.splitExpense(sisig, [partakers[3]]);
    portfolio.splitExpense(karaoke, partakers);
  }

  String get title => portfolio.title;
  List<Partaker> get partakers => portfolio.partakers;
  double get total => portfolio.total;
  PortfolioDivision get division => portfolio.division;
}
