import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/providers/fundprovider/withdramethodprovider.dart';
import 'package:earninggame/ui/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../networking/checkinternet.dart';
import '../networking/data_encryption.dart';
import '../onbording/mobilenoui.dart';
import '../utils/components.dart';
import '../utils/constants.dart';
import '../utils/sharepreferences.dart';

class OtpCheckProvider with ChangeNotifier {
  bool isloading = false;
  int chanceLeft = 0;
  setChanceLeft(int what) {
    chanceLeft = what;
    notifyListeners();
  }

  checkOTPApicall(context, uid, mpin, {bankdetails, withdrawReqData}) async {
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.verifyOtpApiUrl),
            headers: {
              'Content-type': 'application/json',
            },
            body: jsonEncode(DataEncryption.getEncryptedData({
              "env_type": Constants.envType,
              "user_id": uid,
              "security_pin": mpin
            })));
        var data = request.body;
        log(data);
        Map decodedData = jsonDecode(data);

        if (request.statusCode == 200) {
          var resKey = decodedData["data"]['reskey'];
          var resData = decodedData["data"]['resdata'];
          var realdata = DataEncryption.getDecryptedData(resKey, resData);

          // print("${realdata}============ realdata");
          if (realdata['status'] == true) {
            if (bankdetails != null) {
              // customSnackbar(context, "Withdraw method updated");
              Provider.of<WithDrawMethodProvider>(context, listen: false)
                  .withdrawMethodUpdateApiCall(context, bankdetails);
              // Navigator.pop(context);
            } else if (withdrawReqData != null) {
              Provider.of<WithDrawMethodProvider>(context, listen: false)
                  .withdrawReqApiCall(context, withdrawReqData);
            } else {
              customSnackbar(context, "${realdata['msg']}");
              setPreference(context, realdata['user_id'], realdata['user_name'],
                  realdata['mobile']);
            }
          } else {
            chanceLeft += 1;
            if (chanceLeft >= 3) {
              if (bankdetails != null) {
                Navigator.pushAndRemoveUntil(context,
                    CupertinoPageRoute(builder: (context) {
                  return const NavigationUi(widgetIndex: 2);
                }), (route) => false);
              } else {
                Navigator.pushAndRemoveUntil(context,
                    CupertinoPageRoute(builder: (context) {
                  return const MobileNoUi();
                }), (route) => false);
              }
            }
            int left = 3 - chanceLeft;
            customSnackbar(context, "${realdata['msg']}. $left chance left");
          }
        } else {
          customSnackbar(context, "Server error");
        }
      } catch (e) {
        print("che otp ========= $e");
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, "No internet connection found");
    }
    isloading = false;
    notifyListeners();
  }
}
