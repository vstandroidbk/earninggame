import 'dart:async';
import 'package:earninggame/providers/otprequestprovider.dart';
import 'package:earninggame/providers/timerProvider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/otpprovider.dart';
import '../utils/colors.dart';
import '../utils/components.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyMobileNoUi extends StatefulWidget {
  final String mobileNo;
  final bool? isforgetui;
  const VerifyMobileNoUi({super.key, required this.mobileNo, this.isforgetui});

  @override
  State<VerifyMobileNoUi> createState() => _VerifyMobileNoUiState();
}

class _VerifyMobileNoUiState extends State<VerifyMobileNoUi> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  late Timer? timerProvider;
  @override
  void initState() {
    super.initState();
    Provider.of<TimerProvider>(context, listen: false).startTimer();
    timerProvider = Provider.of<TimerProvider>(context, listen: false).timer;
  }

  @override
  void dispose() {
    super.dispose();
    timerProvider!.cancel();
  }

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
                  "VERIFY YOUR MOBILE\n NUMBER ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: blackClr,
                      letterSpacing: 0.8),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                  width: 200, child: Image.asset("assets/images/check.png")),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Verification Code",
                      style: TextStyle(fontSize: 18, color: blackClr),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 230,
                      child: Text(
                        "We have sent the code verification to your mobile number.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: blackClr),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "+91",
                        style: TextStyle(
                            fontSize: 14,
                            color: blackClr,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: "******",
                        style: TextStyle(
                            fontSize: 14,
                            color: blackClr,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: widget.mobileNo.substring(6),
                        style: TextStyle(
                            fontSize: 14,
                            color: blackClr,
                            fontWeight: FontWeight.w600),
                      )
                    ])),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enter Otp",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                        // width: 300,

                        child:customPinCodeTextfield(context, controller: otp1Controller, onComplete: (val) {
                          if (otp1Controller.text.trim().isEmpty) {
                            customSnackbar(
                                context, "All OTP fields are required");
                          } else {
                            Provider.of<OtpProvider>(context, listen: false)
                                .checkOTPApicall(
                                context, widget.mobileNo, otp1Controller.text,
                                isforget: widget.isforgetui);
                          }
                        })
                    )
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<OtpProvider>(
                    builder: (context, otpProvider, child) {
                      return otpProvider.isloading
                          ? const CustomCircularProgress()
                          : SizedBox(
                              width: double.infinity,
                              child:
                                  customElevatedButton(context, "VERIFY", () {
                                if (otp1Controller.text.length < 4) {
                                  customSnackbar(
                                      context, "All OTP fields are required");
                                } else {
                                  otpProvider.checkOTPApicall(context,
                                      widget.mobileNo, otp1Controller.text,
                                      isforget: widget.isforgetui);
                                }
                              }),
                            );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<TimerProvider>(
                    builder: (context, timerProvider, child) {
                      print(timerProvider.timer?.isActive.toString());
                      if (timerProvider.timer?.isActive == true) {
                        return Center(
                          child: Text(
                            "Resend OTP in ${timerProvider.timeLeft}",
                            style: TextStyle(fontSize: 14, color: blackClr),
                          ),
                        );
                      } else {
                        return Center(
                          child: SizedBox(
                            width: 150,
                            // height: ,
                            child:
                                customElevatedButton(context, "RESEND OTP", () {
                              Provider.of<OtpRequestProvider>(context,
                                      listen: false)
                                  .requestOTPApicall(context, widget.mobileNo,
                                      isresend: true);
                              timerProvider.startTimer();
                            }, verticalPadding: 2.0, horizontalPadding: 0.0),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
