import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/otpcheckprovider.dart';
import '../utils/colors.dart';
import '../utils/components.dart';

class SetPinUi extends StatefulWidget {
  // final String mpin;
  final Map userData;
  const SetPinUi({super.key, required this.userData});

  @override
  State<SetPinUi> createState() => _SetPinUiState();
}

class _SetPinUiState extends State<SetPinUi> {
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
                  Center(
                    child: SizedBox(
                      // width: 300,
                      child:
                      Consumer<OtpCheckProvider>(builder:(context, otpCheckProvider,child){
                        return customPinCodeTextfield(context,
                            controller: oneMpinController, onComplete: (val) {
                              String mpinEntered =
                              oneMpinController.text.toString();
                              otpCheckProvider.checkOTPApicall(context,
                                  widget.userData['user_id'], mpinEntered);
                            }) ;
                      })
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
                                String mpinEntered =oneMpinController.text.toString();
                                if (oneMpinController.text.trim().length < 4) {
                                  customSnackbar(
                                      context, "All fields are required.");
                                } else {
                                  otpCheckProvider.checkOTPApicall(context,
                                      widget.userData['user_id'], mpinEntered);
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
