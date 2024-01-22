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

  // TextEditingController gpayController = TextEditingController();
  // TextEditingController phonePayController = TextEditingController();
  // TextEditingController paytmController = TextEditingController();
  // TextEditingController upiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<WithDrawMethodProvider>(context, listen: false)
        .withdrawMethodGetApiCall(context);

    Future.delayed(Duration.zero, () {
      Provider.of<OtpCheckProvider>(context, listen: false).setChanceLeft(0);
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         insetPadding: EdgeInsets.zero,
      //         contentPadding: EdgeInsets.zero,
      //         content: SizedBox(
      //           width: MediaQuery.of(context).size.width * 0.95,
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               SizedBox(
      //                 height: 100,
      //                 child: Image.asset("assets/demoimages/cancel.png"),
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               Text(
      //                 "Withdraw Method not added",
      //                 style: TextStyle(color: clrRed),
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               SizedBox(
      //                 width: 250,
      //                 child: customElevatedButton(context, "OK", () {
      //                   Navigator.pop(context);
      //                 }),
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     });
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
                :
                //  withDrawMethodProvider.withdrawGetMethodData.status == true
                //     ?
                Container(
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                                "Enter Mobile No.(Registered)"),
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
                                                                          "paytm_no": withDrawMethodProvider
                                                                              .paytmController
                                                                              .text,
                                                                          "google_pay_no": withDrawMethodProvider
                                                                              .gpayController
                                                                              .text,
                                                                          "phon_pay_no": withDrawMethodProvider
                                                                              .phonePayController
                                                                              .text,
                                                                          "vpa_id": withDrawMethodProvider
                                                                              .upiController
                                                                              .text
                                                                        },
                                                                      );
                                                                    }));
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
                                              "Add",
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
                                              "assets/images/phonepe-logo-icon.png")),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text("Phone Pay")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                                "Enter Mobile No.(Registered)"),
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
                                                                          "paytm_no": withDrawMethodProvider
                                                                              .paytmController
                                                                              .text,
                                                                          "google_pay_no": withDrawMethodProvider
                                                                              .gpayController
                                                                              .text,
                                                                          "phon_pay_no": withDrawMethodProvider
                                                                              .phonePayController
                                                                              .text,
                                                                          "vpa_id": withDrawMethodProvider
                                                                              .upiController
                                                                              .text
                                                                        },
                                                                      );
                                                                    }));
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
                                              "Add",
                                              style: TextStyle(
                                                  color: clrBlackLight),
                                            )),
                                      )
                                    ],
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
                                    children: [
                                      Text(
                                        withDrawMethodProvider
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
                                                                "Enter Mobile No.(Registered)"),
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
                                                                          "paytm_no": withDrawMethodProvider
                                                                              .paytmController
                                                                              .text,
                                                                          "google_pay_no": withDrawMethodProvider
                                                                              .gpayController
                                                                              .text,
                                                                          "phon_pay_no": withDrawMethodProvider
                                                                              .phonePayController
                                                                              .text,
                                                                          "vpa_id": withDrawMethodProvider
                                                                              .upiController
                                                                              .text
                                                                        },
                                                                      );
                                                                    }));
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
                                              "Add",
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        withDrawMethodProvider
                                                .upiController.text.isEmpty
                                            ? "N/A"
                                            : withDrawMethodProvider
                                                .upiController.text,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
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
                                                                "Enter Mobile No.(Registered)"),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            customInputField(
                                                                withDrawMethodProvider
                                                                    .upiController,
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
                                                                          "paytm_no": withDrawMethodProvider
                                                                              .paytmController
                                                                              .text,
                                                                          "google_pay_no": withDrawMethodProvider
                                                                              .gpayController
                                                                              .text,
                                                                          "phon_pay_no": withDrawMethodProvider
                                                                              .phonePayController
                                                                              .text,
                                                                          "vpa_id": withDrawMethodProvider
                                                                              .upiController
                                                                              .text
                                                                        },
                                                                      );
                                                                    }));
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
                                              "Add",
                                              style: TextStyle(
                                                  color: clrBlackLight),
                                            )),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                            ])
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                            width: double.maxFinite,
                            child: customElevatedButton(context, "Submit", () {
                              // Provider.of<WithDrawMethodProvider>(context,
                              //         listen: false)
                              //     .withdrawMethodGetApiCall(context);
                            })),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
            // : Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: Column(
            //       children: [
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Table(
            //           columnWidths: {
            //             0: FixedColumnWidth(size.width * 0.45),
            //             1: const FixedColumnWidth(10),
            //             2: FixedColumnWidth(size.width * 0.45)
            //           },
            //           children: [
            //             TableRow(children: [
            //               Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     horizontal: 0, vertical: 15),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: greyClr),
            //                     borderRadius:
            //                         BorderRadius.circular(10)),
            //                 child: Column(children: [
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.center,
            //                     children: [
            //                       SizedBox(
            //                           width: 50,
            //                           height: 40,
            //                           child: Image.asset(
            //                               "assets/images/gpay.png")),
            //                       const SizedBox(
            //                         width: 10,
            //                       ),
            //                       const Text("Google Pay")
            //                     ],
            //                   ),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.center,
            //                     children: [
            //                       Text(
            //                         withDrawMethodProvider
            //                                 .gpayController.text.isEmpty
            //                             ? "N/A"
            //                             : withDrawMethodProvider
            //                                 .gpayController.text,
            //                         style: const TextStyle(
            //                             fontWeight: FontWeight.w600),
            //                       ),
            //                       const SizedBox(
            //                         width: 5,
            //                       ),
            //                       SizedBox(
            //                         height: 30,
            //                         child: OutlinedButton(
            //                             onPressed: () {
            //                               showDialog(
            //                                   barrierDismissible: false,
            //                                   context: context,
            //                                   builder: (context) {
            //                                     return AlertDialog(
            //                                       insetPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       contentPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       content: SizedBox(
            //                                         width: double
            //                                             .maxFinite,
            //                                         child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           mainAxisSize:
            //                                               MainAxisSize
            //                                                   .min,
            //                                           children: [
            //                                             const SizedBox(
            //                                               height: 40,
            //                                             ),
            //                                             const Text(
            //                                                 "Enter Mobile No.(Registered)"),
            //                                             const SizedBox(
            //                                               height: 10,
            //                                             ),
            //                                             customInputField(
            //                                                 withDrawMethodProvider
            //                                                     .gpayController,
            //                                                 TextInputType
            //                                                     .number,
            //                                                 maxlength:
            //                                                     10),
            //                                             Row(
            //                                               mainAxisAlignment:
            //                                                   MainAxisAlignment
            //                                                       .spaceAround,
            //                                               children: [
            //                                                 SizedBox(
            //                                                   width:
            //                                                       150,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Cancel",
            //                                                       () {
            //                                                     Navigator.pop(
            //                                                         context);
            //                                                   }),
            //                                                 ),
            //                                                 SizedBox(
            //                                                   width:
            //                                                       140,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Done",
            //                                                       () {
            //                                                     // gpayController.text = gpayController
            //                                                     //     .text
            //                                                     //     .toString();
            //                                                     // setState(
            //                                                     //     () {});
            //                                                     // Navigator.pop(
            //                                                     //     context);
            //                                                     Navigator.push(
            //                                                         context,
            //                                                         CupertinoPageRoute(builder:
            //                                                             (context) {
            //                                                       return PinChekUi(
            //                                                         bankData: <String,
            //                                                             dynamic>{
            //                                                           "env_type": Constants.envType,
            //                                                           "user_id": idUser,
            //                                                           "paytm_no": withDrawMethodProvider.paytmController.text,
            //                                                           "google_pay_no": withDrawMethodProvider.gpayController.text,
            //                                                           "phon_pay_no": withDrawMethodProvider.phonePayController.text,
            //                                                           "vpa_id": withDrawMethodProvider.upiController.text
            //                                                         },
            //                                                       );
            //                                                     }));
            //                                                   }),
            //                                                 )
            //                                               ],
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 30,
            //                                             ),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     );
            //                                   });
            //                             },
            //                             style: OutlinedButton.styleFrom(
            //                                 side: BorderSide(
            //                                     color: clrGreen)),
            //                             child: Text(
            //                               "Add",
            //                               style: TextStyle(
            //                                   color: clrBlackLight),
            //                             )),
            //                       )
            //                     ],
            //                   )
            //                 ]),
            //               ),
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //               Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     horizontal: 0, vertical: 15),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: greyClr),
            //                     borderRadius:
            //                         BorderRadius.circular(10)),
            //                 child: Column(children: [
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.center,
            //                     children: [
            //                       SizedBox(
            //                           width: 50,
            //                           height: 50,
            //                           child: Image.asset(
            //                               "assets/images/phonepe-logo-icon.png")),
            //                       const SizedBox(
            //                         width: 10,
            //                       ),
            //                       const Text("Phone Pay")
            //                     ],
            //                   ),
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.center,
            //                     children: [
            //                       Text(
            //                         withDrawMethodProvider
            //                                 .phonePayController
            //                                 .text
            //                                 .isEmpty
            //                             ? "N/A"
            //                             : withDrawMethodProvider
            //                                 .phonePayController.text,
            //                         style: const TextStyle(
            //                             fontWeight: FontWeight.w600),
            //                       ),
            //                       const SizedBox(
            //                         width: 5,
            //                       ),
            //                       SizedBox(
            //                         height: 30,
            //                         child: OutlinedButton(
            //                             onPressed: () {
            //                               showDialog(
            //                                   barrierDismissible: false,
            //                                   context: context,
            //                                   builder: (context) {
            //                                     return AlertDialog(
            //                                       insetPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       contentPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       content: SizedBox(
            //                                         width: double
            //                                             .maxFinite,
            //                                         child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           mainAxisSize:
            //                                               MainAxisSize
            //                                                   .min,
            //                                           children: [
            //                                             const SizedBox(
            //                                               height: 40,
            //                                             ),
            //                                             const Text(
            //                                                 "Enter Mobile No.(Registered)"),
            //                                             const SizedBox(
            //                                               height: 10,
            //                                             ),
            //                                             customInputField(
            //                                                 withDrawMethodProvider
            //                                                     .phonePayController,
            //                                                 TextInputType
            //                                                     .number,
            //                                                 maxlength:
            //                                                     10),
            //                                             Row(
            //                                               mainAxisAlignment:
            //                                                   MainAxisAlignment
            //                                                       .spaceAround,
            //                                               children: [
            //                                                 SizedBox(
            //                                                   width:
            //                                                       150,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Cancel",
            //                                                       () {
            //                                                     Navigator.pop(
            //                                                         context);
            //                                                   }),
            //                                                 ),
            //                                                 const SizedBox(
            //                                                   width: 40,
            //                                                 ),
            //                                                 SizedBox(
            //                                                   width:
            //                                                       150,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Done",
            //                                                       () {
            //                                                     // phonepayNo =withDrawMethodProvider.phonePayController
            //                                                     //     .text
            //                                                     //     .toString();
            //                                                     // setState(
            //                                                     //     () {});
            //                                                     // Navigator.pop(
            //                                                     //    withDrawMethodProvider. context);
            //                                                     Navigator.push(
            //                                                         context,
            //                                                         CupertinoPageRoute(builder:
            //                                                             (context) {
            //                                                       return PinChekUi(
            //                                                         bankData: <String,
            //                                                             dynamic>{
            //                                                           "env_type": Constants.envType,
            //                                                           "user_id": idUser,
            //                                                           "paytm_no": withDrawMethodProvider.paytmController.text,
            //                                                           "google_pay_no": withDrawMethodProvider.gpayController.text,
            //                                                           "phon_pay_no": withDrawMethodProvider.phonePayController.text,
            //                                                           "vpa_id": withDrawMethodProvider.upiController.text
            //                                                         },
            //                                                       );
            //                                                     }));
            //                                                   }),
            //                                                 )
            //                                               ],
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 30,
            //                                             ),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     );
            //                                   });
            //                             },
            //                             style: OutlinedButton.styleFrom(
            //                                 side: BorderSide(
            //                                     color: clrGreen)),
            //                             child: Text(
            //                               "Add",
            //                               style: TextStyle(
            //                                   color: clrBlackLight),
            //                             )),
            //                       )
            //                     ],
            //                   )
            //                 ]),
            //               ),
            //             ]),
            //             const TableRow(children: [
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               )
            //             ]),
            //             TableRow(children: [
            //               Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     horizontal: 15, vertical: 15),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: greyClr),
            //                     borderRadius:
            //                         BorderRadius.circular(10)),
            //                 child: Column(children: [
            //                   Row(
            //                     children: [
            //                       SizedBox(
            //                           width: 50,
            //                           height: 40,
            //                           child: Image.asset(
            //                               "assets/images/paytm.png")),
            //                       const SizedBox(
            //                         width: 10,
            //                       ),
            //                       const Text("Paytm")
            //                     ],
            //                   ),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text(
            //                         withDrawMethodProvider
            //                                 .paytmController
            //                                 .text
            //                                 .isEmpty
            //                             ? "N/A"
            //                             : withDrawMethodProvider
            //                                 .paytmController.text,
            //                         style: const TextStyle(
            //                             fontWeight: FontWeight.w600),
            //                       ),
            //                       const SizedBox(
            //                         width: 5,
            //                       ),
            //                       SizedBox(
            //                         height: 30,
            //                         child: OutlinedButton(
            //                             onPressed: () {
            //                               showDialog(
            //                                   barrierDismissible: false,
            //                                   context: context,
            //                                   builder: (context) {
            //                                     return AlertDialog(
            //                                       insetPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       contentPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       content: SizedBox(
            //                                         width: double
            //                                             .maxFinite,
            //                                         child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           mainAxisSize:
            //                                               MainAxisSize
            //                                                   .min,
            //                                           children: [
            //                                             const SizedBox(
            //                                               height: 40,
            //                                             ),
            //                                             const Text(
            //                                                 "Enter Mobile No.(Registered)"),
            //                                             const SizedBox(
            //                                               height: 10,
            //                                             ),
            //                                             customInputField(
            //                                                 withDrawMethodProvider
            //                                                     .paytmController,
            //                                                 TextInputType
            //                                                     .number,
            //                                                 maxlength:
            //                                                     10),
            //                                             Row(
            //                                               mainAxisAlignment:
            //                                                   MainAxisAlignment
            //                                                       .spaceAround,
            //                                               children: [
            //                                                 SizedBox(
            //                                                   width:
            //                                                       150,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Cancel",
            //                                                       () {
            //                                                     Navigator.pop(
            //                                                         context);
            //                                                   }),
            //                                                 ),
            //                                                 SizedBox(
            //                                                   width:
            //                                                       150,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Done",
            //                                                       () {
            //                                                     // PaytmNo = paytmController
            //                                                     //     .text
            //                                                     //     .toString();
            //                                                     // setState(
            //                                                     //     () {});
            //                                                     Navigator.pop(
            //                                                         context);
            //                                                   }),
            //                                                 )
            //                                               ],
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 30,
            //                                             ),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     );
            //                                   });
            //                             },
            //                             style: OutlinedButton.styleFrom(
            //                                 side: BorderSide(
            //                                     color: clrGreen)),
            //                             child: Text(
            //                               "Add",
            //                               style: TextStyle(
            //                                   color: clrBlackLight),
            //                             )),
            //                       )
            //                     ],
            //                   )
            //                 ]),
            //               ),
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //               Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     horizontal: 0, vertical: 15),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: greyClr),
            //                     borderRadius:
            //                         BorderRadius.circular(10)),
            //                 child: Column(children: [
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.center,
            //                     children: [
            //                       SizedBox(
            //                           width: 50,
            //                           height: 50,
            //                           child: Image.asset(
            //                               "assets/images/upi.png")),
            //                       const SizedBox(
            //                         width: 30,
            //                       ),
            //                       const Text("VPA")
            //                     ],
            //                   ),
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.center,
            //                     children: [
            //                       Text(
            //                         withDrawMethodProvider
            //                                 .upiController.text.isEmpty
            //                             ? "N/A"
            //                             : withDrawMethodProvider
            //                                 .upiController.text,
            //                         style: const TextStyle(
            //                             fontWeight: FontWeight.w600),
            //                       ),
            //                       const SizedBox(
            //                         width: 10,
            //                       ),
            //                       SizedBox(
            //                         height: 30,
            //                         child: OutlinedButton(
            //                             onPressed: () {
            //                               showDialog(
            //                                   barrierDismissible: false,
            //                                   context: context,
            //                                   builder: (context) {
            //                                     return AlertDialog(
            //                                       insetPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       contentPadding:
            //                                           const EdgeInsets
            //                                                   .symmetric(
            //                                               horizontal:
            //                                                   10),
            //                                       content: SizedBox(
            //                                         width: double
            //                                             .maxFinite,
            //                                         child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           mainAxisSize:
            //                                               MainAxisSize
            //                                                   .min,
            //                                           children: [
            //                                             const SizedBox(
            //                                               height: 40,
            //                                             ),
            //                                             const Text(
            //                                                 "Enter Mobile No.(Registered)"),
            //                                             const SizedBox(
            //                                               height: 10,
            //                                             ),
            //                                             customInputField(
            //                                                 withDrawMethodProvider
            //                                                     .upiController,
            //                                                 TextInputType
            //                                                     .number,
            //                                                 maxlength:
            //                                                     10),
            //                                             Row(
            //                                               mainAxisAlignment:
            //                                                   MainAxisAlignment
            //                                                       .spaceAround,
            //                                               children: [
            //                                                 SizedBox(
            //                                                   width:
            //                                                       150,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Cancel",
            //                                                       () {
            //                                                     Navigator.pop(
            //                                                         context);
            //                                                   }),
            //                                                 ),
            //                                                 SizedBox(
            //                                                   width:
            //                                                       150,
            //                                                   child: customElevatedButton(
            //                                                       context,
            //                                                       "Done",
            //                                                       () {
            //                                                     // VpaUpi = upiController
            //                                                     //     .text
            //                                                     //     .toString();
            //                                                     // setState(
            //                                                     //     () {});
            //                                                     Navigator.pop(
            //                                                         context);
            //                                                   }),
            //                                                 )
            //                                               ],
            //                                             ),
            //                                             const SizedBox(
            //                                               height: 30,
            //                                             ),
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     );
            //                                   });
            //                             },
            //                             style: OutlinedButton.styleFrom(
            //                                 side: BorderSide(
            //                                     color: clrGreen)),
            //                             child: Text(
            //                               "Add",
            //                               style: TextStyle(
            //                                   color: clrBlackLight),
            //                             )),
            //                       )
            //                     ],
            //                   )
            //                 ]),
            //               ),
            //             ])
            //           ],
            //         ),
            //         const Expanded(child: SizedBox()),
            //         SizedBox(
            //             width: double.maxFinite,
            //             child:
            //                 customElevatedButton(context, "Submit", () {
            //               // Provider.of<WithDrawMethodProvider>(context,
            //               //         listen: false)
            //               //     .withdrawMethodGetApiCall(context);
            //             })),
            //         const SizedBox(
            //           height: 20,
            //         )
            //       ],
            //     ),
            //   );

            //  SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         Container(
            //           margin:
            //               const EdgeInsets.symmetric(horizontal: 10),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               const SizedBox(
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 height: 80,
            //                 child: Center(
            //                     child: Image.asset(
            //                         "assets/demoimages/demoicon.png")),
            //               ),
            //               const SizedBox(
            //                 height: 50,
            //               ),
            //               const Text("Account Holder Name"),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               customInputField(
            //                   nameController, TextInputType.text),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               const Text("Account Number"),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               customInputField(
            //                   noController, TextInputType.text),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               const Text("IFSC Code"),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               customInputField(
            //                   codeController, TextInputType.text),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               const Text("Bank Name"),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               customInputField(
            //                   bankController, TextInputType.text),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               const Text("Address"),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               customInputField(
            //                   addController, TextInputType.text),
            //               const SizedBox(
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 width: double.infinity,
            //                 child: customElevatedButton(context, "SAVE",
            //                     () {
            //                   // Navigator.push(context,
            //                   //     CupertinoPageRoute(builder: (context) {
            //                   //   return AddBankDetailTwoUi();
            //                   // }));
            //                   showDialog(
            //                       context: context,
            //                       builder: (context) {
            //                         return AlertDialog(
            //                           insetPadding:
            //                               const EdgeInsets.symmetric(
            //                                   horizontal: 10),
            //                           contentPadding: EdgeInsets.zero,
            //                           content: SizedBox(
            //                             width: MediaQuery.of(context)
            //                                 .size
            //                                 .width,
            //                             child: Column(
            //                               mainAxisSize:
            //                                   MainAxisSize.min,
            //                               children: [
            //                                 const SizedBox(
            //                                   height: 30,
            //                                 ),
            //                                 SizedBox(
            //                                     width: 100,
            //                                     child: Image.asset(
            //                                         "assets/demoimages/Pass.png")),
            //                                 const SizedBox(
            //                                   height: 30,
            //                                 ),
            //                                 const Text(
            //                                     "Your Bank Details Updated Successfully."),
            //                                 const SizedBox(
            //                                   height: 20,
            //                                 ),
            //                                 Padding(
            //                                   padding: const EdgeInsets
            //                                           .symmetric(
            //                                       horizontal: 50,
            //                                       vertical: 10),
            //                                   child: SizedBox(
            //                                     width: double.infinity,
            //                                     child:
            //                                         customElevatedButton(
            //                                             context, "Ok",
            //                                             () {
            //                                       // Navigator.pop(context);
            //                                       // Navigator.pop(context);
            //                                       Navigator.push(
            //                                           context,
            //                                           CupertinoPageRoute(
            //                                               builder:
            //                                                   (context) {
            //                                         return const BankDetailsUi();
            //                                       }));
            //                                     }),
            //                                   ),
            //                                 ),
            //                                 const SizedBox(
            //                                   height: 20,
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         );
            //                       });
            //                 }),
            //               ),
            //               const SizedBox(
            //                 height: 20,
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   );
          },
        ));
  }
}
