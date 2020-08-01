import 'package:flutter/foundation.dart';

import '../models/portfolio.dart';

class CurrentPortfolio with ChangeNotifier {
  Portfolio portfolio;

  CurrentPortfolio() {
    portfolio = Portfolio(title: 'Samgyupsal on the Moon');
  }

  String get title => portfolio.title;
  double get total => portfolio.total;
}