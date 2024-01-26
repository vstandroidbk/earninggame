import 'package:earninggame/providers/fundprovider/withdramethodprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/ui/funduis/pincheckui.dart';
import 'package:earninggame/utils/components.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/otpcheckprovider.dart';
import '../../utils/colors.dart';

class AddBankDetailOneUi extends StatefulWidget {
  const AddBankDetailOneUi({super.key});

  @override
  State<AddBankDetailOneUi> createState() => _AddBankDetailOneUiState();
}

class _AddBankDetailOneUiState extends State<AddBankDetailOneUi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController addController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<WithDrawMethodProvider>(context, listen: false)
        .withdrawMethodGetApiCall(context);

    Future.delayed(Duration.zero, () {
      Provider.of<OtpCheckProvider>(context, listen: false).setChanceLeft(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBarComman(const Text("Withdraw Method")),
        body: Consumer<WithDrawMethodProvider>(
          builder: (context, withDrawMethodProvider, child) {
            return withDrawMethodProvider.isGetDataLoding
                ? const CustomCircularProgress()
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Table(
                          columnWidths: {
                            0: FixedColumnWidth(size.width * 0.45),
                            1: const FixedColumnWidth(10),
                            2: FixedColumnWidth(size.width * 0.45)
                          },
                          children: [
                            TableRow(children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: greyClr),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          height: 40,
                                          child: Image.asset(
                                              "assets/images/gpay.png")),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text("Google Pay")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          withDrawMethodProvider
                                                  .gpayController.text.isEmpty
                                              ? "N/A"
                                              : withDrawMethodProvider
                                                  .gpayController.text,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        insetPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        content: SizedBox(
                                                          width: double.maxFinite,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            children: [
                                                              const SizedBox(
                                                                height: 40,
                                                              ),
                                                              const Text(
                                                                  "Enter Google Pay Mobile Number "),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              customInputField(
                                                                  withDrawMethodProvider
                                                                      .gpayController,
                                                                  TextInputType
                                                                      .number,
                                                                  maxlength: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 150,
                                                                    child: customElevatedButton(
                                                                        context,
                                                                        "Cancel",
                                                                        () {
                                                                          Provider.of<WithDrawMethodProvider>(context, listen: false)
                                                                              .withdrawMethodGetApiCall(context);
                                                                      Navigator.pop(
                                                                          context);
                                                                    }),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 140,
                                                                    child: customElevatedButton(
                                                                        context,
                                                                        "Done",
                                                                        () {
                                                                      if (withDrawMethodProvider
                                                                              .gpayController
                                                                              .text
                                                                              .length <
                                                                          10) {
                                                                        customSnackbar(
                                                                            context,
                                                                            "Minimum 10 number required.");
                                                                      } else {
                                                                        Navigator.push(
                                                                            context,
                                                                            CupertinoPageRoute(builder:
                                                                                (context) {
                                                                          return PinChekUi(
                                                                            bankData: {
                                                                              "env_type":
                                                                                  Constants.envType,
                                                                              "user_id":
                                                                                  idUser,
                                                                              "withdraw_method_no":
                                                                                  withDrawMethodProvider.gpayController.text,
                                                                              "withdraw_method_type":
                                                                                  2
                                                                            },
                                                                          );
                                                                        }));
                                                                      }
                                                                    }),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                      color: clrGreen)),
                                              child: Text(
                                                withDrawMethodProvider
                                                    .gpayController
                                                    .text
                                                    .isEmpty?"Add":"Edit",
                                                style: TextStyle(
                                                    color: clrBlackLight),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: greyClr),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(
                                              "assets/images/phonepe-logo-icon.png")),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text("Phone Pay")
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          withDrawMethodProvider
                                                  .phonePayController.text.isEmpty
                                              ? "N/A"
                                              : withDrawMethodProvider
                                                  .phonePayController.text,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        insetPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        content: SizedBox(
                                                          width: double.maxFinite,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            children: [
                                                              const SizedBox(
                                                                height: 40,
                                                              ),
                                                              const Text(
                                                                  "Enter PhonePay Mobile Number"),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              customInputField(
                                                                  withDrawMethodProvider
                                                                      .phonePayController,
                                                                  TextInputType
                                                                      .number,
                                                                  maxlength: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 150,
                                                                    child: customElevatedButton(
                                                                        context,
                                                                        "Cancel",
                                                                        () {
                                                                          Provider.of<WithDrawMethodProvider>(context, listen: false)
                                                                              .withdrawMethodGetApiCall(context);
                                                                      Navigator.pop(
                                                                          context);
                                                                    }),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 40,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 150,
                                                                    child: customElevatedButton(
                                                                        context,
                                                                        "Done",
                                                                        () {
                                                                      if (withDrawMethodProvider
                                                                              .phonePayController
                                                                              .text
                                                                              .length <
                                                                          10) {
                                                                        customSnackbar(
                                                                            context,
                                                                            "Minimum 10 number required.");
                                                                      } else {
                                                                        Navigator.push(
                                                                            context,
                                                                            CupertinoPageRoute(builder:
                                                                                (context) {
                                                                          return PinChekUi(
                                                                            bankData: {
                                                                              "env_type":
                                                                                  Constants.envType,
                                                                              "user_id":
                                                                                  idUser,
                                                                              "withdraw_method_no":
                                                                                  withDrawMethodProvider.phonePayController.text,
                                                                              "withdraw_method_type":
                                                                                  3
                                                                            },
                                                                          );
                                                                        }));
                                                                      }
                                                                    }),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                      color: clrGreen)),
                                              child: Text(
                                                withDrawMethodProvider
                                                    .phonePayController
                                                    .text
                                                    .isEmpty?"Add":"Edit",
                                                style: TextStyle(
                                                    color: clrBlackLight),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ]),
                            const TableRow(children: [
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: greyClr),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          height: 40,
                                          child: Image.asset(
                                              "assets/images/paytm.png")),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text("Paytm")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(withDrawMethodProvider
                                                .paytmController.text.isEmpty
                                            ? "N/A"
                                            : withDrawMethodProvider
                                                .paytmController.text,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      insetPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 10),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 10),
                                                      content: SizedBox(
                                                        width: double.maxFinite,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const SizedBox(
                                                              height: 40,
                                                            ),
                                                            const Text(
                                                                "Enter Paytm Mobile Number"),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            customInputField(
                                                                withDrawMethodProvider
                                                                    .paytmController,
                                                                TextInputType
                                                                    .number,
                                                                maxlength: 10),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                SizedBox(
                                                                  width: 150,
                                                                  child: customElevatedButton(
                                                                      context,
                                                                      "Cancel",
                                                                      () {
                                                                        Provider.of<WithDrawMethodProvider>(context, listen: false)
                                                                            .withdrawMethodGetApiCall(context);
                                                                    Navigator.pop(
                                                                        context);
                                                                  }),
                                                                ),
                                                                SizedBox(
                                                                  width: 150,
                                                                  child: customElevatedButton(
                                                                      context,
                                                                      "Done",
                                                                      () {
                                                                    if (withDrawMethodProvider
                                                                            .paytmController
                                                                            .text
                                                                            .length <
                                                                        10) {
                                                                      customSnackbar(
                                                                          context,
                                                                          "Minimum 10 number required.");
                                                                    } else {
                                                                      Navigator.push(
                                                                          context,
                                                                          CupertinoPageRoute(builder:
                                                                              (context) {
                                                                        return PinChekUi(
                                                                          bankData: {
                                                                            "env_type":
                                                                                Constants.envType,
                                                                            "user_id":
                                                                                idUser,
                                                                            "withdraw_method_no":
                                                                                withDrawMethodProvider.paytmController.text,
                                                                            "withdraw_method_type":
                                                                                1
                                                                          },
                                                                        );
                                                                      }));
                                                                    }
                                                                  }),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                    color: clrGreen)),
                                            child: Text(
                                              withDrawMethodProvider
                                                  .paytmController
                                                  .text
                                                  .isEmpty? "Add":"Edit",
                                              style: TextStyle(
                                                  color: clrBlackLight),
                                            )),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: greyClr),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(
                                              "assets/images/upi.png")),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text("VPA")
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            withDrawMethodProvider
                                                    .upiController.text.isEmpty
                                                ? "N/A"
                                                : withDrawMethodProvider
                                                    .upiController.text,
                                            // maxLines: 1,
                                            // overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        insetPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        content: SizedBox(
                                                          width: double.maxFinite,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            children: [
                                                              const SizedBox(
                                                                height: 40,
                                                              ),
                                                              const Text(
                                                                  "Enter VPA Id"),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              customInputField(
                                                                  withDrawMethodProvider
                                                                      .upiController,
                                                                  TextInputType
                                                                      .text,
                                                                 ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 150,
                                                                    child: customElevatedButton(
                                                                        context,
                                                                        "Cancel",
                                                                        () {
                                                                          Provider.of<WithDrawMethodProvider>(context, listen: false)
                                                                              .withdrawMethodGetApiCall(context);
                                                                      Navigator.pop(
                                                                          context);
                                                                    }),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 150,
                                                                    child: customElevatedButton(
                                                                        context,
                                                                        "Done",
                                                                        () {

                                                                        if (withDrawMethodProvider
                                                                                .upiController
                                                                                .text
                                                                                .isEmpty) {
                                                                          customSnackbar(
                                                                              context,
                                                                              "VPA id cant be empty.");
                                                                        } else {
                                                                          Navigator.push(
                                                                              context,
                                                                              CupertinoPageRoute(builder:
                                                                                  (context) {
                                                                            return PinChekUi(
                                                                              bankData: {
                                                                                "env_type": Constants.envType,
                                                                                "user_id": idUser,
                                                                                "withdraw_method_no": withDrawMethodProvider.upiController.text,
                                                                                "withdraw_method_type": 4
                                                                              },
                                                                            );
                                                                          }));
                                                                      }
                                                                    }),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                      color: clrGreen)),
                                              child: Text(
                                                withDrawMethodProvider
                                                    .upiController
                                                    .text
                                                    .isEmpty?"Add":"Edit",
                                                style: TextStyle(
                                                    color: clrBlackLight),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ])
                          ],
                        ),
                      ],
                    ),
                  );
          },
        ));
  }
}
