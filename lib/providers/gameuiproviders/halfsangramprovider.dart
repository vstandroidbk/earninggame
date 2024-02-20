import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../profileprovider.dart';

class HalfSangram extends ChangeNotifier{
  clearval(){
    _gametype="open";
    _totalBids = [];
  }
  String? _gametype="open";
  get gameType => _gametype;

  setgameTypeChange(val) {
    _gametype = val;
    notifyListeners();
  }
   List<Map<String, dynamic>> _totalBids = [];

  get totalBids => _totalBids;
  addTotalBids(context,{open,close, points, type}) {
    int addnew = 0;
    int curerntAmount= Provider.of<ProfileProvider>(context,listen: false).amountTemporary;
    if (_totalBids.isEmpty == false) {
      for (int i = 0; _totalBids.length > i; i++) {
        if (int.parse(_totalBids[i]['open'].toString()) == int.parse(open) &&
            int.parse(_totalBids[i]['close'].toString()) == int.parse(close)) {
          addnew = 1;
          int oldPoints= int.parse(_totalBids[i]['points'].toString());
          int newPt = int.parse(points.toString());
          _totalBids[i]['points'] = newPt;
          int oldAmount=curerntAmount+oldPoints;
          int newAmountWillBe=oldAmount-newPt;
          log("oldAmount=$oldAmount oldPoints=$oldPoints newAmountWillBe=$newAmountWillBe curerntAmount$curerntAmount== fun");
          Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
        }
      }
      if (addnew == 0) {
        _totalBids.add({"open": open,"close":close, "points": points, "type": type});
        int newAmountWillBe= curerntAmount - int.parse(points.toString());
        Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
      }
    } else {
      _totalBids.add({"open": open,"close":close,  "points": points, "type": type});
      int newAmountWillBe= curerntAmount - int.parse(points.toString());
      Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
    }

    notifyListeners();
  }


  removeBids(index,context) {
    int curerntAmount= Provider.of<ProfileProvider>(context,listen: false).amountTemporary;
    for (int i = 0; _totalBids.length > i; i++) {
      if (int.parse(i.toString()) ==
          int.parse(index.toString())) {
        int oldPoint=int.parse(_totalBids[i]['points'].toString());
        _totalBids.removeAt(i);
        print("$oldPoint oldPoint========");
        int newAmountWillBe= curerntAmount + oldPoint;
        Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
      }
    }
    notifyListeners();
  }
  clearAllBids(){
    _totalBids=[];
    notifyListeners();
  }
}