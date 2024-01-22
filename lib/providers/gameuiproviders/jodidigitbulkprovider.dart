import 'package:flutter/material.dart';

class JodiDigitBulkGameProvider with ChangeNotifier {
  final List<Map> _totalBids = [];

  get totalBids => _totalBids;
  addTotalBids(jodi, points) {
    _totalBids.add({"jodi": jodi, "points": points});
    notifyListeners();
  }

  removeBids(index) {
    _totalBids.removeAt(index);
    notifyListeners();
  }

  removeAllBids() {
    _totalBids.clear();
    notifyListeners();
  }

  // String? _gametype;
  // get gameType => _gametype;

  // setgameTypeChange(val) {
  //   _gametype = val;
  //   notifyListeners();
  // }
}
