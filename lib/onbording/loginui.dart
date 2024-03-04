import 'dart:developer';

import 'package:earninggame/onbording/forgotmpinui.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/ui/navigation.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../providers/loginprovider.dart';
import '../providers/otprequestprovider.dart';
import '../utils/components.dart' ;


class LoginUi extends StatefulWidget {
  final String? mobNo;
  const LoginUi({super.key, this.mobNo});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Center(
                child: SizedBox(
                    width: 200,
                    child: Image.asset("assets/demoimages/demoicon.png")),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                // "Login with Mpin",
                "Enter password",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 15, color: blackClr),
              ),
              const SizedBox(
                height: 20,
              ),
              customInputField(passcontroller, TextInputType.visiblePassword),
              const SizedBox(
                height: 20,
              ),
              Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  return loginProvider.isloading
                      ? const CustomCircularProgress()
                      : SizedBox(
                          width: double.infinity,
                          child: customElevatedButton(context, "Next", () {
                            if (passcontroller.text.isEmpty) {
                              customSnackbar(context, "Password is required");
                            } else {
                              loginProvider.loginApiCall(context, widget.mobNo,
                                  passcontroller.text.trim());
                            }
                          }));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<OtpRequestProvider>(
                builder: (context, otpRequestProvider, child) {
                  return otpRequestProvider.isloading
                      ? const CustomCircularProgress()
                      : InkWell(
                          onTap: () {
                            otpRequestProvider.requestOTPApicall(
                                context, widget.mobNo,
                                isforget: true);
                          },
                          child: const Center(
                            child: Text(
                              // "Forgot Mpin ?",
                              "Forgot Password ?",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        );
                },
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: InkWell(
                  // onTap: () async {
                  //   FocusScope.of(context).unfocus();
                  //   try {
                  //     final LocalAuthentication auth = LocalAuthentication();
                  //     bool checkStatus = await auth.canCheckBiometrics;
                  //     if (checkStatus == false) {
                  //       customSnackbar(context, "Finger print lock not supported in your device");
                  //     } else {
                  //       final List<BiometricType> availableBiometrics =
                  //       await auth.getAvailableBiometrics();
                  // log("${availableBiometrics}");
                  //
                  //       if (availableBiometrics.isNotEmpty) {
                  //         customSnackbar(context, "No biometric available ");
                  //       }
                  //
                  //       if (availableBiometrics.contains(BiometricType.strong)) {
                  //         // Specific types of biometrics are available.
                  //         // Use checks like this with caution!
                  //         print("done here=============");
                  //       var  suthenticate= await auth.authenticate(
                  //             localizedReason: 'Please authenticate for login to your account',
                  //             options: const AuthenticationOptions(biometricOnly: true));
                  //       print("$suthenticate =============");
                  //       }
                  //       // final bool canAuthenticateWithBiometrics =
                  //       //     await auth.canCheckBiometrics;
                  //       // customSnackbar(context, "$canAuthenticateWithBiometrics Something went wrong... ");
                  //     }
                  //   }catch(e){
                  //     print(e);
                  //     customSnackbar(context, "Something went wrong... $e");
                  //   }
                  //
                  //   // try {
                  //   //   final bool didAuthenticate = await auth.authenticate(
                  //   //       localizedReason: 'Please authenticate to show account balance',
                  //   //       options: const AuthenticationOptions(useErrorDialogs: false));
                  //   //   // ···
                  //   // } on PlatformException catch (e) {
                  //   //   customSnackbar(context, "Something went wrong... $e");
                  //   // }
                  // },
                  //
                  child: SizedBox(
                      width: 130,
                      child: Image.asset("assets/demoimages/biometric.png")),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
