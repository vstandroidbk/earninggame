import 'dart:convert';
import 'package:earninggame/models/gdbidhistorymodel.dart';
import 'package:earninggame/models/kingjackpotresultmodel.dart';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/galigamesmodel.dart';
import '../models/galiratesmodel.dart';

class GaliProvider with ChangeNotifier {
  GaliGmRatesModel _galiratesData = GaliGmRatesModel();
  get galiGmRatesData => _galiratesData;
  bool isloading = false;
  getGaliRatesApiCall(context) async {
    bool isInternet = await hasNetwork();

    isloading = true;
    _galiratesData = GaliGmRatesModel();
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.galiGmRatesApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel resIncData =
              ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              "${resIncData.data?.reskey}", "${resIncData.data?.resdata}");
          _galiratesData = GaliGmRatesModel.fromJson(decreptedData);
          // print(
          //     "${decreptedData} ========================== decreptedData data");
          notifyListeners();
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isloading = false;
    notifyListeners();
  }

  GaliGamesModel _galiGameData = GaliGamesModel();
  get galiGameData => _galiGameData;
  bool isGameloading = false;
  galiGamesApiCall(context) async {
    bool isInternet = await hasNetwork();

    isGameloading = true;
    _galiGameData = GaliGamesModel();
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.galiGamesApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel resIncData =
              ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              "${resIncData.data?.reskey}", "${resIncData.data?.resdata}");
          _galiGameData = GaliGamesModel.fromJson(decreptedData);
          // print(
          //     "${decreptedData} ========================== decreptedData data");
          notifyListeners();
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isGameloading = false;
    notifyListeners();
  }

  //king jackpot (gali dishavar ) api
  KingjackpotGmResultModel _kingjackpotresultmodel = KingjackpotGmResultModel();
  get jackpotResultData => _kingjackpotresultmodel;
  bool isJsckpotResultLonding = false;
  jackpotResultApicall(context, date) async {
    bool isNetwrok = await hasNetwork();
    isJsckpotResultLonding = true;
    notifyListeners();
    if (isNetwrok) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.galiResultApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "date": date})));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBodyData = jsonDecode(request.body);
          ResponseIncriptModel response =
              ResponseIncriptModel.fromJson(decodedBodyData);
          Map<String, dynamic> getDecriptedData =
              DataEncryption.getDecryptedData(response.data!.reskey.toString(),
                  response.data!.resdata.toString());
          _kingjackpotresultmodel =
              KingjackpotGmResultModel.fromJson(getDecriptedData);
          notifyListeners();
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isJsckpotResultLonding = false;
    notifyListeners();
  }

  //gali bid history api call
  GdBidHistoryModel _galiBidHisData = GdBidHistoryModel();
  get getGaliBidHisData => _galiBidHisData;
  bool isBidHisLoding = false;
  galiBidHisApiCall(context) async {
    bool isInternet = await hasNetwork();

    isBidHisLoding = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.gdBidHistoryApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType,
                  "user_id":idUser,//"517935902854",
                  "bid_from": "",
                  "bid_to": ""
                })));
        if (request.statusCode == 200) {
          Map<String, dynamic> decodedBody = jsonDecode(request.body);
          ResponseIncriptModel resIncData =
          ResponseIncriptModel.fromJson(decodedBody);
          Map<String, dynamic> decreptedData = DataEncryption.getDecryptedData(
              "${resIncData.data?.reskey}", "${resIncData.data?.resdata}");
          _galiBidHisData = GdBidHistoryModel.fromJson(decreptedData);
          // print(
          //     "${decreptedData} ========================== decreptedData data");
          notifyListeners();
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isBidHisLoding = false;
    notifyListeners();
  }
}
