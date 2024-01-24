import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:earninggame/onbording/loginui.dart';
import 'package:earninggame/onbording/mobilenoui.dart';
import 'package:earninggame/onbording/setpinui.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/createuserprovider.dart';
import '../utils/colors.dart';
import '../utils/components.dart';
import '../utils/constants.dart';

class CreateAccountUi extends StatefulWidget {
  String mobileNo;
  CreateAccountUi({super.key, required this.mobileNo});

  @override
  State<CreateAccountUi> createState() => _CreateAccountUiState();
}

class _CreateAccountUiState extends State<CreateAccountUi> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  TextEditingController mpinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
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
                  "CREATE YOUR NEW \n ACCOUNT ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: blackClr,
                      letterSpacing: 0.8),
                ),
              ],
            ),
            Center(
              child: SizedBox(
                  height: 180,
                  child: Image.asset("assets/images/pngtree-mobile.png")),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "*Enter Name",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(userNameController, TextInputType.text),
                  Text(
                    "Enter Email (Optional)",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(emailController, TextInputType.text),
                  Text(
                    "*Set MPIN",
                    style: TextStyle(
                      fontSize: 15,
                      color: blackClr,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(mpinController, TextInputType.number,
                      maxlength: 4),
                  Text(
                    "*Enter Password",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<CreateUserProvider>(
                      builder: (context, createUserProvider, child) {
                    return customInputField(passController, TextInputType.text,
                        suffixicon: InkWell(
                            onTap: () {
                              createUserProvider.setPassVisibility(
                                  !createUserProvider.isPassVisible);
                            },
                            child: createUserProvider.isPassVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),obscureText:!createUserProvider.isPassVisible);
                  }),
                  Text(
                    "*Enter Confirm Password",
                    style: TextStyle(fontSize: 15, color: blackClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<CreateUserProvider>(
                      builder: (context, createUserProvider, child) {
                        return customInputField(conPassController, TextInputType.text,
                            suffixicon: InkWell(
                                onTap: () {
                                  createUserProvider.setConPassVisibility(
                                      !createUserProvider.isConPassVisible);
                                },
                                child: createUserProvider.isConPassVisible
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),obscureText:!createUserProvider.isConPassVisible);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Already have an account? "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return const MobileNoUi();
                            }));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: primaryColor),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<CreateUserProvider>(
                    builder: (context, createUserProvider, child) {
                      return createUserProvider.isloading
                          ? const CustomCircularProgress()
                          : SizedBox(
                              width: double.infinity,
                              child: customElevatedButton(context, "Next", () {
                                if (userNameController.text.isEmpty) {
                                  customSnackbar(context, "Name is required");
                                } else if (mpinController.text.isEmpty) {
                                  customSnackbar(context, "MPIN is required");
                                } else if (mpinController.text.length < 4) {
                                  customSnackbar(
                                      context, "MPIN must have 4 characters");
                                } else if (passController.text.isEmpty) {
                                  customSnackbar(
                                      context, "Password is required");
                                } else if (passController.text.length < 6) {
                                  customSnackbar(context,
                                      "Password must have minimum 6 characters");
                                } else if (conPassController.text.isEmpty) {
                                  customSnackbar(
                                      context, "Confirm password is required");
                                } else if (passController.text.trim() !=
                                    conPassController.text.trim()) {
                                  customSnackbar(context,
                                      "Password and Confirm passward do not match.");
                                } else {
                                  if (emailController.text.isNotEmpty) {
                                    bool isvalidEmail = EmailValidator.validate(
                                        emailController.text);
                                    if (!isvalidEmail) {
                                      customSnackbar(
                                          context, "Please enter valid email");
                                    } else {
                                      Map<String, dynamic> userData = {
                                        "env_type": Constants.envType,
                                        "mobile": widget.mobileNo,
                                        "name": userNameController.text.trim(),
                                        "email": emailController.text.trim(),
                                        "password": passController.text.trim(),
                                        "security_pin":
                                            mpinController.text.trim(),
                                      };
                                      log(userData.toString());

                                      createUserProvider.createUserApicall(
                                          context, userData);
                                    }
                                  } else {
                                    Map<String, dynamic> userData = {
                                      "env_type": Constants.envType,
                                      "mobile": widget.mobileNo,
                                      "name": userNameController.text.trim(),
                                      "email": emailController.text.trim(),
                                      "password": passController.text.trim(),
                                      "security_pin":
                                          mpinController.text.trim(),
                                    };
                                    log(userData.toString());

                                    createUserProvider.createUserApicall(
                                        context, userData);
                                  }
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
