import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/models/responseincriptmodel.dart';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/starlinegamesmodel.dart';
import '../models/starlineratesmodel.dart';
import '../ui/gamestypekingstarlineui.dart';
import 'gameuiproviders/slgamesprovider.dart';

class StarlineGamesProvider with ChangeNotifier {
  StarlineGameRatesModel _starlineGmRatesData = StarlineGameRatesModel();
  StarlineGamesModel _starlineGamesData = StarlineGamesModel();

  get getStartlineGmRatesData => _starlineGmRatesData;
  get getstarlineGamesData => _starlineGamesData;
  bool isloading = false;
  bool isgamesloading = false;
  starlineGmRatesApiCall(context) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request =
            await http.post(Uri.parse(Constants.gameRatesApiUrl),
                body: jsonEncode(DataEncryption.getEncryptedData({
                  "env_type": Constants.envType,
                })));
        if (request.statusCode == 200) {
          _starlineGmRatesData = StarlineGameRatesModel();
          Map<String, dynamic> dataIn = jsonDecode(request.body);

          ResponseIncriptModel dataDec = ResponseIncriptModel.fromJson(dataIn);
          Map<String, dynamic> realdata = DataEncryption.getDecryptedData(
              "${dataDec.data?.reskey}", "${dataDec.data?.resdata}");
          if (realdata['status'] == true) {
            _starlineGmRatesData = StarlineGameRatesModel.fromJson(realdata);
            notifyListeners();
          } else {
            customSnackbar(context, "${realdata['msg']}");
          }

          log("real data gm===============================$realdata=====");
          // print("${homeModelData} ===data");
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
        log(e.toString());
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isloading = false;
    notifyListeners();
  }

  starlineGamesApiCall(context) async {
    bool isInternet = await hasNetwork();
    _starlineGamesData = StarlineGamesModel();
    isgamesloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request =
            await http.post(Uri.parse(Constants.starlineGamesApiUrl),
                body: jsonEncode(DataEncryption.getEncryptedData({
                  "env_type": Constants.envType,
                })));
        if (request.statusCode == 200) {
          Map<String, dynamic> dataIn = jsonDecode(request.body);

          ResponseIncriptModel dataDec = ResponseIncriptModel.fromJson(dataIn);
          Map<String, dynamic> realdata = DataEncryption.getDecryptedData(
              "${dataDec.data?.reskey}", "${dataDec.data?.resdata}");
          if (realdata['status'] == true) {
            _starlineGamesData = StarlineGamesModel.fromJson(realdata);
            notifyListeners();
          } else {
            customSnackbar(context, "${realdata['msg']}");
          }

          log("real data gm===============================$realdata=====");
          // print("${homeModelData} ===data");
        } else {
          customSnackbar(context, serverErrortMsg);
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong . $e");
        log(e.toString());
      }
    } else {
      customSnackbar(context, noInternetMsg);
    }
    isgamesloading = false;
    notifyListeners();
  }

  //api for check game time status active or close
  bool isGameTimeStatusloading = false;
  stGameStatusCheckApiCall(context, idGame, {gmName, bidData}) async {
    bool ishaveNetwork = await hasNetwork();
    isGameTimeStatusloading = true;
    notifyListeners();
    if (ishaveNetwork) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.slGameStatusCheckApiUrl),
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "game_id": idGame})));
        if (request.statusCode == 200) {
          Map<String, dynamic> bodyData = jsonDecode(request.body);
          ResponseIncriptModel responseData =
              ResponseIncriptModel.fromJson(bodyData);
          Map getEncryptedData = DataEncryption.getDecryptedData(
              responseData.data!.reskey.toString(),
              responseData.data!.resdata.toString());
          debugPrint("$getEncryptedData ===============");

          if (getEncryptedData['status'] == true) {
            if (gmName != null) {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return GamesTypeKingStarlineUi(
                  gameName: gmName,
                  gameId: idGame,
                );
              })).then((value) {
                Provider.of<StarlineGamesProvider>(context, listen: false)
                    .starlineGmRatesApiCall(context);
                Provider.of<StarlineGamesProvider>(context, listen: false)
                    .starlineGamesApiCall(context);
              });
            } else if (bidData != null) {
              Provider.of<SlGameProvider>(context, listen: false)
                  .ksGameSubmitApiCall(context, bidData);
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
