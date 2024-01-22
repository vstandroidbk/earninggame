import 'package:flutter/material.dart';

class SinglePanaGameProvider with ChangeNotifier {
  final List<Map> _totalBids = [];

  get totalBids => _totalBids;
  addTotalBids(digit, points, type) {
    _totalBids.add({"digit": digit, "points": points, "type": type});
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

  String? _gametype;
  get gameType => _gametype;

  setgameTypeChange(val) {
    _gametype = val;
    notifyListeners();
  }
}
