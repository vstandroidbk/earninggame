import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../models/responseincriptmodel.dart';
import '../../networking/checkinternet.dart';
import '../../networking/data_encryption.dart';
import '../../utils/components.dart';
import '../../utils/constants.dart';
import '../profileprovider.dart';

class SlGameProvider with ChangeNotifier {
  // bool clearDigit = false;
  // setClearDigit(bool val){
  //   clearDigit=val;
  //   notifyListeners();
  // }
  TextEditingController singleDigitController = TextEditingController();
  setSingleDigiConVal(val){
    singleDigitController.text=val;
    notifyListeners();
  }
  final List<Map<String, dynamic>> _totalBids = [];

  get totalBids => _totalBids;
  addTotalBids(context,{digit, points, type}) {
    int addnew = 0;
          int curerntAmount= Provider.of<ProfileProvider>(context,listen: false).amountTemporary;
    if (_totalBids.isEmpty == false) {
      for (int i = 0; _totalBids.length > i; i++) {
        if (int.parse(_totalBids[i]['digit'].toString()) == int.parse(digit)) {
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
        _totalBids.add({"digit": digit, "points": points, "type": type});
        int newAmountWillBe= curerntAmount - int.parse(points.toString());
          Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
      }
    } else {
      _totalBids.add({"digit": digit, "points": points, "type": type});
      int newAmountWillBe= curerntAmount - int.parse(points.toString());
      Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
    }

    notifyListeners();
  }

  removeBids(digit,context) {
    int curerntAmount= Provider.of<ProfileProvider>(context,listen: false).amountTemporary;
    for (int i = 0; _totalBids.length > i; i++) {
      if (int.parse(_totalBids[i]['digit'].toString()) ==
          int.parse(digit.toString())) {
        int oldPoint=int.parse(_totalBids[i]['points'].toString());
        _totalBids.removeAt(i);
        print("$oldPoint oldPoint========");
        int newAmountWillBe= curerntAmount + oldPoint;
        Provider.of<ProfileProvider>(context,listen: false).setGetAmount(newAmountWillBe);
      }
    }
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
  String? digitValCommon;
  setDigitval(val){
    digitValCommon=val;
    notifyListeners();
  }
  //api for king games submit
  bool isSingleDigitSubmitLoading = false;
  ksGameSubmitApiCall(context, newResult) async {
    // log("submit agi called == $newResult ==");
    bool ishaveNetwork = await hasNetwork();
    isSingleDigitSubmitLoading = true;
    notifyListeners();
    if (ishaveNetwork) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.ksSingleDigitGameSumitApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "new_result": newResult})));
        if (request.statusCode == 200) {
          Map<String, dynamic> bodyData = jsonDecode(request.body);
          ResponseIncriptModel responseData =
              ResponseIncriptModel.fromJson(bodyData);
          Map<String, dynamic> getEncryptedData =
              DataEncryption.getDecryptedData(
                  responseData.data!.reskey.toString(),
                  responseData.data!.resdata.toString());
          debugPrint("$getEncryptedData ===============debug print");
          // if (getEncryptedData['status'] == true) {
          // return Navigator.pop(context);
          // }

          Provider.of<SlGameProvider>(context, listen: false).removeAllBids();
          Provider.of<SlGameProvider>(context, listen: false)
              .setgameTypeChange(null);

          Provider.of<ProfileProvider>(context, listen: false)
              .profileDataApiCall(context);
          customSnackbar(context, getEncryptedData['msg']);
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isSingleDigitSubmitLoading = false;
    notifyListeners();
  }
}
