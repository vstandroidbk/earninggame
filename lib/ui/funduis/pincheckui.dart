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
  TextEditingController twoMpinController = TextEditingController();
  TextEditingController threeMpinController = TextEditingController();
  TextEditingController fourMpinController = TextEditingController();
  int wrongDone = 0;

  @override
  void initState() {
    super.initState();
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
                  "VALIDATE YOUR\n PIN ",
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
                  Center(
                    child: SizedBox(
                      // width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              // width: 80,
                              // height: 100,
                              child: customInputFieldPin(oneMpinController,
                                  TextInputType.number, context,
                                  maxlength: 1,
                                  horizontalpad: 10.0,
                                  textalign: true,
                                  verticalpad: 25.0)),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              // width: 50,
                              child: customInputFieldPin(twoMpinController,
                                  TextInputType.number, context,
                                  maxlength: 1,
                                  textalign: true,
                                  horizontalpad: 10.0,
                                  verticalpad: 25.0)),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              // width: 50,
                              child: customInputFieldPin(
                                  threeMpinController,
                                  textalign: true,
                                  TextInputType.number,
                                  context,
                                  maxlength: 1,
                                  horizontalpad: 10.0,
                                  verticalpad: 25.0)),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              // width: 50,
                              child: customInputFieldPin(
                                  fourMpinController,
                                  textalign: true,
                                  TextInputType.number,
                                  context,
                                  maxlength: 1,
                                  horizontalpad: 10.0,
                                  verticalpad: 25.0)),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                                    "${oneMpinController.text.trim()}${twoMpinController.text.trim()}${threeMpinController.text.trim()}${fourMpinController.text.trim()}";
                                if (oneMpinController.text.trim().isEmpty ==
                                    true) {
                                  customSnackbar(
                                      context, "All fields are required.");
                                } else if (twoMpinController.text
                                    .trim()
                                    .isEmpty) {
                                  customSnackbar(
                                      context, "All fields are required.");
                                } else if (threeMpinController.text
                                    .trim()
                                    .isEmpty) {
                                  customSnackbar(
                                      context, "All fields are required.");
                                } else if (fourMpinController.text
                                    .trim()
                                    .isEmpty) {
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
