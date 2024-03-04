import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/providers/gameuiproviders/halfsangramprovider.dart';
import 'package:earninggame/providers/gameuiproviders/spdptpprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../models/responseincriptmodel.dart';
import '../../networking/checkinternet.dart';
import 'package:http/http.dart' as http;
import '../../networking/data_encryption.dart';
import '../../ui/gamestypeui.dart';
import '../../utils/components.dart';
import '../../utils/constants.dart';
import '../homeprovider.dart';
import '../profileprovider.dart';

class MainGamesProvider with ChangeNotifier{

  String? _gametype;
  get gameType => _gametype;

  setgameTypeChange(val) {
    _gametype = val;
    notifyListeners();
  }

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

  // String? _gametype;
  // get gameType => _gametype;
  //
  // setgameTypeChange(val) {
  //   _gametype = val;
  //   notifyListeners();
  // }
  String? digitValCommon;
  setDigitval(val){
    digitValCommon=val;
    notifyListeners();
  }
  //api for main games submit
  bool isSingleDigitSubmitLoading = false;
  mainGameCommonSubmitApiCall(context, newResult) async {
    log("submit agi called == $newResult ==");
    bool ishaveNetwork = await hasNetwork();
    isSingleDigitSubmitLoading = true;
    notifyListeners();
    if (ishaveNetwork) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.mainGameCommonSumitApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "new_result": newResult})));
        print("============== ${request.body} =============== request.statusCode gk");
        if (request.statusCode == 200) {
          Map<String, dynamic> bodyData = jsonDecode(request.body);
            print("${bodyData} =============bodyData11111===");
          if(bodyData['status'] != null){
          if(bodyData['status']==false){
              customSnackbar(context, bodyData['msg']);
            }
          }else{
          print("${bodyData} =============bodyData===");
          ResponseIncriptModel responseData =
          ResponseIncriptModel.fromJson(bodyData);
          print("${responseData} =============responseData===");
          Map<String, dynamic> getEncryptedData =
          DataEncryption.getDecryptedData(
              responseData.data!.reskey.toString(),
              responseData.data!.resdata.toString());

          print("${getEncryptedData} =============b===");
          debugPrint("$getEncryptedData ===============debug print");
          // if (getEncryptedData['status'] == true) {
          // return Navigator.pop(context);
          // }

          Provider.of<MainGamesProvider>(context, listen: false).removeAllBids();
          Provider.of<HalfSangram>(context, listen: false).clearAllBids();
          Provider.of<MainGamesProvider>(context, listen: false)
              .setgameTypeChange(null);

          Provider.of<ProfileProvider>(context, listen: false)
              .profileDataApiCall(context);

          Provider.of<SpDpTpProvider>(context,listen: false).clearCmbination();
          customSnackbar(context, getEncryptedData['msg']);
        }

          // }else{
          //   customSnackbar(context, bodyData['msg']);
          // }

        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        print("= $e ===========");
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isSingleDigitSubmitLoading = false;
    notifyListeners();
  }
  //api for check game time status active or close
  bool isGameTimeStatusloading = false;
  mainGameStatusCheckApiCall(context, idGame, {gmName, bidData,closeTime}) async {
    print("idGame= $idGame ==========");
    bool ishaveNetwork = await hasNetwork();
    isGameTimeStatusloading = true;
    notifyListeners();
    if (ishaveNetwork) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.mainGameStatusCheckApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "game_id": idGame})));
        if (request.statusCode == 200) {
          Map<String, dynamic> bodyData = jsonDecode(request.body);
          // print("$bodyData ============== bodyData mm");
          ResponseIncriptModel responseData =
          ResponseIncriptModel.fromJson(bodyData);
          Map getEncryptedData = DataEncryption.getDecryptedData(
              responseData.data!.reskey.toString(),
              responseData.data!.resdata.toString());
          debugPrint("$getEncryptedData ===============");

          if (getEncryptedData['status'] == true) {
            if (gmName != null) {
              Navigator.push(context,
                  CupertinoPageRoute(
                      builder: (context) {
                        return  GamesTypeUi(
                          gameName: gmName,
                          gameId: idGame,
                            closeTime:closeTime
                        );
                      })).then((value) {
                Provider.of<ProfileProvider>(context,
                    listen: false)
                    .profileDataApiCall(context);
                Provider.of<HomeProvider>(context,
                    listen: false)
                    .homeDataApiCall(context);
              });
            } else if (bidData != null) {
              Provider.of<MainGamesProvider>(context, listen: false).mainGameCommonSubmitApiCall(context, bidData);
            }
          } else {
            customSnackbar(context, getEncryptedData['msg']);
          }
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isGameTimeStatusloading = false;
    notifyListeners();
  }

}