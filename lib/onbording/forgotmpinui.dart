import 'package:earninggame/providers/forgetpassprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mobilenoui.dart';

class FortgotMpinUi extends StatefulWidget {
  final String mobNo;
  const FortgotMpinUi({super.key, required this.mobNo});

  @override
  State<FortgotMpinUi> createState() => _FortgotMpinUiState();
}

class _FortgotMpinUiState extends State<FortgotMpinUi> {
  TextEditingController passController = TextEditingController();
  TextEditingController conpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 65,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "CREATE NEW \n PASSWORD ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: blackClr,
                      letterSpacing: 0.8),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                  width: 200,
                  child: Image.asset(
                    "assets/demoimages/pin.png",
                    color: primaryColor,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Password",
                    style: TextStyle(
                        // fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(
                      passController, TextInputType.visiblePassword),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(
                      conpassController, TextInputType.visiblePassword),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<ForgetPassProvider>(
                    builder: (context, forgetPassProvider, child) {
                      return forgetPassProvider.isloading
                          ? const CustomCircularProgress()
                          : SizedBox(
                              width: double.infinity,
                              child: customElevatedButton(context, "NEXT", () {
                                if (passController.text.trim().isEmpty) {
                                  customSnackbar(
                                      context, "New password is required .");
                                } else if (passController.text.trim().length <=
                                    5) {
                                  customSnackbar(context,
                                      "Password must have minimum 6 characters.");
                                } else if (conpassController.text
                                    .trim()
                                    .isEmpty) {
                                  customSnackbar(context,
                                      "Confirm password is required .");
                                } else if (conpassController.text
                                        .trim()
                                        .toString() !=
                                    passController.text.trim().toString()) {
                                  customSnackbar(context,
                                      "Password and Confirm password does not match .");
                                } else {
                                  // Navigator.pushAndRemoveUntil(context,
                                  //     CupertinoPageRoute(builder: (context) {
                                  //   return const MobileNoUi();
                                  // }), (route) => false);
                                  forgetPassProvider.forgetPassUpApiCall(
                                      context,
                                      widget.mobNo,
                                      passController.text.trim());
                                }
                              }),
                            );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
