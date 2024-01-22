import 'package:flutter/material.dart';

class SingleDigitBulkGameProvider with ChangeNotifier {
  final List<Map> _totalBids = [];

  get totalBids => _totalBids;
  addTotalBids(nums, bids, points, type) {
    //  int oldbids= ;

    _totalBids.add({"num": nums, "bids": bids, "points": points, "type": type});
    notifyListeners();
  }

  removeBids(index) {
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
