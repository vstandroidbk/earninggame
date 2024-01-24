import 'package:earninggame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/otpcheckprovider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class PinChekUi extends StatefulWidget {
  final Map<String, dynamic>? bankData;
  final Map<String, dynamic>? withdrawReqData;
  const PinChekUi({super.key, this.bankData, this.withdrawReqData});

  @override
  State<PinChekUi> createState() => _PinChekUiState();
}

class _PinChekUiState extends State<PinChekUi> {
  TextEditingController oneMpinController = TextEditingController();
  // TextEditingController twoMpinController = TextEditingController();
  // TextEditingController threeMpinController = TextEditingController();
  // TextEditingController fourMpinController = TextEditingController();
  int wrongDone = 0;

  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    // this.oneMpinController.;
    // ignore: avoid_print
    super.dispose();
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
                  "VERIFY YOUR\n PIN ",
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
                  width: 250, child: Image.asset("assets/images/pngloc.png")),
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
                  Text(
                    "Enter Mpin",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer<OtpCheckProvider>(
                      builder: (context, otpCheckProvider, child) {
                    return otpCheckProvider.isloading
                        ? const Center(child: CircularProgressIndicator())
                        : customPinCodeTextfield(context,
                            controller: oneMpinController, onComplete: (val) {
                            String mpinEntered =
                                 oneMpinController.text.toString();
                              if (widget.bankData != null) {
                                otpCheckProvider.checkOTPApicall(
                                    context, idUser, mpinEntered,
                                    bankdetails: widget.bankData);
                              } else if (widget.withdrawReqData != null) {
                                otpCheckProvider.checkOTPApicall(
                                    context, idUser, mpinEntered,
                                    withdrawReqData: widget.withdrawReqData);
                              }else{
                                customSnackbar(context, "Something went wrong.");
                              }
                          });
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<OtpCheckProvider>(
                    builder: (context, otpCheckProvider, child) {
                      return otpCheckProvider.isloading
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                              width: double.infinity,
                              child: customElevatedButton(context, "Next", () {
                                String mpinEntered =
                                    oneMpinController.text.toString();
                                if (oneMpinController.text.length <4) {
                                  customSnackbar(
                                      context, "All fields are required.");
                                } else {
                                  if (widget.bankData != null) {
                                    otpCheckProvider.checkOTPApicall(
                                        context, idUser, mpinEntered,
                                        bankdetails: widget.bankData);
                                  } else if (widget.withdrawReqData != null) {
                                    otpCheckProvider.checkOTPApicall(
                                        context, idUser, mpinEntered,
                                        withdrawReqData:
                                            widget.withdrawReqData);
                                  }
                                }
                              }),
                            );
                    },
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
