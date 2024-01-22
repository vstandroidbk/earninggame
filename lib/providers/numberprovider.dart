import 'dart:convert';
import 'dart:developer';
import 'package:earninggame/networking/checkinternet.dart';
import 'package:earninggame/networking/data_encryption.dart';
import 'package:earninggame/onbording/loginui.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'otprequestprovider.dart';

class NumberProvider extends ChangeNotifier {
  bool isloading = false;
  mobNoApicall(context, mobNo) async {
    // var data = jsonEncode(DataEncryption.getEncryptedData(
    //     {"env_type": Constants.envType, "mobile": mobNo}));
    // print("$data ====================================== sended");
    bool isInternet = await hasNetwork();
    isloading = true;
    notifyListeners();
    // print("loder true done =======");
    if (isInternet) {
      try {
        http.Response request = await http.post(
            Uri.parse(Constants.numberApiUrl),
            headers: {
              'Content-type': 'application/json',
            },
            body: jsonEncode(DataEncryption.getEncryptedData(
                {"env_type": Constants.envType, "mobile": mobNo})));
        var data = request.body;
        log(data);
        Map decodedData = jsonDecode(data);

        if (request.statusCode == 200) {
          var resKey = decodedData["data"]['reskey'];
          var resData = decodedData["data"]['resdata'];
          var realdata = DataEncryption.getDecryptedData(resKey, resData);
          // print(
          //     "${realdata}====${realdata['register_status'].runtimeType}======== realdata");
          if (realdata['register_status'] == "0") {
            customSnackbar(context, "Mobile number not registered");
            Provider.of<OtpRequestProvider>(context, listen: false)
                .requestOTPApicall(context, mobNo);
          } else {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return LoginUi(
                mobNo: mobNo,
              );
            }));
          }
        } else {
          customSnackbar(context, "Server error");
        }
      } catch (e) {
        customSnackbar(context, "Something went wrong. $e");
      }
    } else {
      customSnackbar(context, "No internet connection found");
    }
    isloading = false;
    notifyListeners();
  }
}
