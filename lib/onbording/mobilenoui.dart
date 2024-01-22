import 'package:earninggame/providers/numberprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/otpcheckprovider.dart';
import '../utils/colors.dart';
import '../utils/components.dart';

class MobileNoUi extends StatefulWidget {
  const MobileNoUi({super.key});

  @override
  State<MobileNoUi> createState() => _MobileNoUiState();
}

class _MobileNoUiState extends State<MobileNoUi> {
  TextEditingController mobNoController = TextEditingController();

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
                  "ENTER YOUR MOBILE \n NUMBER ",
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
                  height: 350,
                  child: Image.asset("assets/images/enter-number.png")),
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
                    "Enter Mobile Number",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(mobNoController, TextInputType.number,
                      maxlength: 10),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<NumberProvider>(
                    builder: (context, numberProvider, child) {
                      return numberProvider.isloading
                          ? const CustomCircularProgress()
                          : SizedBox(
                              width: double.infinity,
                              child: customElevatedButton(context, "Next", () {
                                if (mobNoController.text == "") {
                                  customSnackbar(
                                      context, "Mobile Number is required");
                                } else if (mobNoController.text.length <= 9) {
                                  customSnackbar(
                                      context, "Min 10 number is required");
                                } else {
                                  Provider.of<OtpCheckProvider>(context,
                                          listen: false)
                                      .setChanceLeft(0);
                                  Provider.of<NumberProvider>(context,
                                          listen: false)
                                      .mobNoApicall(
                                          context, mobNoController.text);
                                }
                              }),
                            );
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
