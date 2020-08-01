import 'package:flutter/foundation.dart';

import '../models/partaker.dart';
import '../models/portfolio.dart';
import '../models/portfolio_division.dart';

class CurrentPortfolio with ChangeNotifier {
  Portfolio portfolio;

  CurrentPortfolio() {
    portfolio = Portfolio(title: 'Samgyupsal on the Moon');
  }

  String get title => portfolio.title;
  List<Partaker> get partakers => portfolio.partakers;
  double get total => portfolio.total;
  PortfolioDivision get division => portfolio.division;
}
