import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/updatepassprovider.dart';
import '../utils/colors.dart';
import '../utils/components.dart';
import 'components/drawer.dart';

class UpdatePassUi extends StatefulWidget {
  const UpdatePassUi({super.key});

  @override
  State<UpdatePassUi> createState() => _UpdatePassUiState();
}

class _UpdatePassUiState extends State<UpdatePassUi> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController oldcontroller = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController conController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: SizedBox(
                  width: 50,
                  height: 30,
                  child: Image.asset("assets/demoimages/menu-bar.png")),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Update Password"),
        actions: [
          SizedBox(
              width: 25, child: Image.asset("assets/demoimages/wallet.png")),
          const SizedBox(
            width: 5,
          ),
          const Center(
            child: Text(
              "500.00",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Center(
            child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                    maxRadius: 17,
                    backgroundColor: greyDarkClr,
                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: primaryColor,
                    ))),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Center(
                    child: SizedBox(
                      height: 60,
                      child: Image.asset("assets/demoimages/demoicon.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Enter Your Old Password"),
                  customInputField(
                      oldcontroller, TextInputType.visiblePassword),
                  const Text("Enter New Password"),
                  customInputField(
                      newController, TextInputType.visiblePassword),
                  const Text("Enter Confirm Password"),
                  customInputField(
                      conController, TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<UpdatePassProvider>(
                    builder: (context, updatePassProvider, child) {
                      return updatePassProvider.isloading
                          ? const Center(
                              child: CustomCircularProgress(),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: customElevatedButtonTop(
                                  context,
                                  const Text(
                                    "UPDATE PASSWORD",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        wordSpacing: 5,
                                        letterSpacing: 1.5),
                                  ), () {
                                if (oldcontroller.text.trim().isEmpty) {
                                  customSnackbar(
                                      context, "Old password is required .");
                                } else if (newController.text.trim().isEmpty) {
                                  customSnackbar(
                                      context, "New password is required .");
                                } else if (newController.text.trim().length <
                                    6) {
                                  customSnackbar(context,
                                      "New password must be minimum 6 characters .");
                                } else if (conController.text.trim().isEmpty) {
                                  customSnackbar(context,
                                      "Confirm password is required .");
                                } else if (conController.text
                                        .trim()
                                        .toString() !=
                                    newController.text.trim().toString()) {
                                  customSnackbar(context,
                                      "Password and Confirm password do not match .");
                                } else {
                                  updatePassProvider.updatePassApiCall(
                                      context,
                                      idUser,
                                      oldcontroller.text.trim(),
                                      newController.text.trim());
                                }
                              }),
                            );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      )),
      drawer: const DrawerManueUi(),
    );
  }
}
