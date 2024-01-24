import 'dart:developer';

import 'package:earninggame/providers/gameuiproviders/slgamesprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../providers/profileprovider.dart';
import 'colors.dart';
import 'constants.dart';

AppBar appBarComman(titlewidget) {
  return AppBar(
    title: titlewidget,
    foregroundColor: blackClr,
    backgroundColor: clrTranaparent,
    elevation: 0,
    actions: [
      Row(
        children: [
          SizedBox(
            width: 35,
            child: Image.asset("assets/images/Wallett.png"),
          ),
          const SizedBox(
            width: 5,
          ),
          Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
              return Center(
                child: Text(
                  "${profileProvider.profileModelData.profile?[0].walletBalance}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
      )
    ],
  );
}

TextFormField customInputField(controller, keybordType,
    {maxlength, textalign, hintText, prefixIcon,onedtingConmplete,focus,onchanged,suffixicon,obscureText}) {
  return TextFormField(
    obscureText:obscureText ?? false,
    onChanged:onchanged ,
    onEditingComplete:onedtingConmplete ,
    focusNode: focus,
    textAlign: textalign == null ? TextAlign.start : TextAlign.center,
    maxLength: maxlength,
    inputFormatters: keybordType == TextInputType.number
        ? [FilteringTextInputFormatter.digitsOnly]
        : null,
    controller: controller,
    keyboardType: keybordType,
    decoration: InputDecoration(
        suffixIcon:suffixicon ,
        prefixIcon: prefixIcon,
        hintText: hintText ?? '',
        counter: const Text(''),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        filled: true,
        fillColor: greyLightClr,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        )),
  );
}

ElevatedButton customElevatedButton(BuildContext context, text, ontap,
    {backgrouncolor, verticalPadding, horizontalPadding}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgrouncolor ?? primaryColor,
        foregroundColor: blackClr,
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 14,
            horizontal: horizontalPadding ?? 0),
      ),
      onPressed: ontap,
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 1.5),
      ));
}

ElevatedButton customElevatedButtonTop(BuildContext context, anyWidget, ontap,
    {backgrouncolor, verticalPadding, horizontalPadding}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgrouncolor ?? primaryColor,
        foregroundColor: blackClr,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 14,
            horizontal: horizontalPadding ?? 0),
      ),
      onPressed: ontap,
      child: anyWidget);
}

customSnackbar(context, msg) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(msg),
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ));
}

customPinCodeTextfield(context,{required controller,required onComplete}){
  return PinCodeTextField(
      autoDisposeControllers:false,
      textStyle: TextStyle(),
    pinTheme: PinTheme(
      inactiveFillColor: greyLightClr,
      selectedFillColor: greyLightClr,
      activeColor: greyLightClr,
      activeFillColor: greyLightClr,
      selectedColor: greyLightClr,
      inactiveColor: greyLightClr,
      fieldWidth: 60,
      fieldHeight: 60,

    ),

    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    enableActiveFill: true,
    cursorColor: blackClr,
    appContext: context,
    length: 4,
    controller:controller ,
    keyboardType: TextInputType.number,
    onCompleted:onComplete ,
  );

}

TextFormField customInputFieldPin(controller, keybordType, context,
    {maxlength, textalign, maxLines, hintText, horizontalpad, verticalpad,onedtingConmplete,focus}) {
  return TextFormField(

    inputFormatters: [ FilteringTextInputFormatter
        .digitsOnly],
    focusNode: focus,
    onEditingComplete: onedtingConmplete,
    maxLines: maxLines,
    textAlign: textalign == null ? TextAlign.start : TextAlign.center,
    onChanged: (val) {
      if (val.length == maxlength) {
      FocusScope.of(context).nextFocus();
      }
      log("$val =====");
      if(val.length == 0) {
      FocusScope.of(context).previousFocus();
      }
    },
    maxLength: maxlength,
    controller: controller,
    keyboardType: keybordType,
    decoration: InputDecoration(
        hintText: hintText,
        counter: const Text(''),
        counterStyle: const TextStyle(),
        hintStyle: const TextStyle(),
        contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalpad ?? 0, vertical: verticalpad ?? 0),
        filled: true,
        fillColor: greyLightClr,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        )),
  );
}

alertCustomerSupport(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        TextEditingController emaiController = TextEditingController();
        TextEditingController issueController = TextEditingController();
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 8),
          contentPadding: EdgeInsets.zero,
          scrollable: true,
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 40,
                          child: Image.asset(
                              "assets/demoimages/customer_support.png")),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Support",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Email*"),
                      const SizedBox(
                        height: 7,
                      ),
                      customInputField(
                          emaiController, TextInputType.emailAddress),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Report Issue *"),
                      const SizedBox(
                        height: 7,
                      ),
                      customInputFieldPin(
                          issueController, TextInputType.emailAddress, context,
                          maxLines: 5, maxlength: 2000, textalign: true),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: double.infinity,
                              child: customElevatedButtonTop(
                                  context, const Text("Cancel"), () {
                                Navigator.pop(context);
                              }),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: SizedBox(
                              width: double.infinity,
                              child: customElevatedButtonTop(
                                  context, const Text("Submit"), () {
                                Navigator.pop(context);
                                customSnackbar(
                                    context, "Report Submitted Successfully.");
                              }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

DropdownButtonFormField<String> customDropDownMenueButton(dropValue, onchange) {
  return DropdownButtonFormField(
    isExpanded: true,
    hint: const Text("Select Game Type"),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      filled: true,
      fillColor: greyLightClr,
      enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide.none), //, borderRadius: BorderRadius.circular(20)
      focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide.none), //, borderRadius: BorderRadius.circular(20)
    ),
    value: dropValue,
    items: const [
      DropdownMenuItem(
        value: "open",
        child: Text("Open"),
      ),
      DropdownMenuItem(
        value: "closed",
        child: Text("Closed"),
      ),
    ],
    onChanged: onchange,
  );
}

Future<dynamic> customFilter(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          // contentPadding: EdgeInsets.zero,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          scrollable: true,
          title: const Center(
            child: Text(
              "Filter Type",
              style: TextStyle(fontSize: 20),
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // const Text("By Game Type"),
                // const SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Checkbox(value: true, onChanged: (val) {}),
                //         const Text("OPEN")
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Checkbox(value: true, onChanged: (val) {}),
                //         const Text("CLOSE")
                //       ],
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                const Text("By Winning Status"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (val) {}),
                        const Text("Win")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (val) {}),
                        const Text("Loss")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (val) {}),
                        const Text("Pending")
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("By Games"),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: greyLightClr,
                            // borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Checkbox(value: true, onChanged: (val) {}),
                              Text("${index + 1} : 00 PM")
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: customElevatedButton(context, "Set Filter", () {
                        Navigator.pop(context);
                      }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: customElevatedButton(context, "Cancel Filter", () {
                        Navigator.pop(context);
                      }),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Future<dynamic> popupWorkingMoneyReduction(BuildContext context, onsubmit,
    {data, totalbid, bidamount, currentBalance, afterBalance, isType}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 0),
          contentPadding: const EdgeInsets.symmetric(),
          // title: const Text("TIME BAZAR -18/12/2023"),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "TIME BAZAR ", //20/12/2023
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                        // isType != null
                        //     ? const [
                        //         // if(data)
                        //         Text("Digit"),
                        //         Text("Points"),
                        //         Text("Type"),
                        //       ]
                        //     :
                        const [
                                Text("Digit"),
                                Text("Points "),
                              ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        itemCount: data.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: clrWhite,
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: isType != null
                                      ? [
                                          Text("${data[index]['digit']}"),
                                          Text("${data[index]['points']}"),
                                          Text("${data[index]['type']}")
                                        ]
                                      : [
                                          Text("${data[index]['digit']}"),
                                          Text("${data[index]['points']}"),
                                        ]));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Table(
                          children: [
                            TableRow(
                                decoration: const BoxDecoration(),
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text("Total Bids"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Center(
                                        child: Text(
                                      "$totalbid",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text("Total Bids Amount"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Center(
                                        child: Text(
                                      "$bidamount",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Balance Before Deduction"),
                              ),
                              Consumer<ProfileProvider>(
                                builder: (context, profileProvider, child) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Center(
                                        child: Text(
                                      "${profileProvider.profileModelData.profile?[0].walletBalance}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )),
                                  );
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Balance After Deduction"),
                              ),
                              Consumer<ProfileProvider>(
                                builder: (context, profileProvider, child) {
                                  int currentBal = int.parse(
                                      "${profileProvider.profileModelData.profile?[0].walletBalance ?? 0}");
                                  int bidsTotalPoint =
                                      int.parse(bidamount.toString());
                                  int afterBid = currentBal - bidsTotalPoint;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Center(
                                        child: Text(
                                      "$afterBid",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )),
                                  );
                                },
                              ),
                            ])
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "*Note: Bid Once Played Can Not Be Canclled*",
                        style: TextStyle(color: clrRed),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 120,
                            child: customElevatedButton(
                                context, "SUBMIT", onsubmit,
                                verticalPadding: 8.0),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 120,
                            child: customElevatedButton(context, "CANCEL", () {
                              Navigator.pop(context);
                            }, verticalPadding: 8.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Future<dynamic> popUpInsufficientBalance(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Icon(
                  Icons.cancel_outlined,
                  color: clrRed,
                  size: 70,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Insufficient Wallet Balance",
                  style: TextStyle(color: clrRed),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: customElevatedButton(context, "ok", () {
                    Navigator.pop(context);
                  }, verticalPadding: 8.0),
                )
              ],
            ),
          ),
        );
      });
}

Future<dynamic> popUpBidSuccess(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset("assets/images/check.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Bid successfully submitted",
                  style: TextStyle(color: clrGreen),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: customElevatedButton(context, "ok", () {
                    Navigator.pop(context);
                  }, verticalPadding: 8.0),
                )
              ],
            ),
          ),
        );
      });
}
class CustomAutofill extends StatefulWidget {
  final List arrayList;
  const CustomAutofill({super.key,required this.arrayList});

  @override
  State<CustomAutofill> createState() => _CustomAutofillState();
}

class _CustomAutofillState extends State<CustomAutofill> {
  @override
  Widget build(BuildContext context) {
    return  TypeAheadField(
      textFieldConfiguration:
      TextFieldConfiguration(
        onChanged: (val){
          Provider.of<SlGameProvider>(context,listen: false).setDigitval(val.toString());
        },

        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter
              .digitsOnly
        ],
        decoration: InputDecoration(
            hintText: 'Search here',
            border: InputBorder.none,
            fillColor: greyLightClr,
            filled: true),
      ),
      suggestionsCallback: (pattern) {
        return
          widget.arrayList.where((fruit) => fruit
            .toLowerCase()
            .contains(
            pattern.toLowerCase()))
            .toList();
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Consumer<SlGameProvider>(builder: (context,slGameProvider,child){
            return  Text("${slGameProvider.digitValCommon}") ;
          }),
        );
      },
      onSuggestionSelected: (suggestion) {
        Provider.of<SlGameProvider>(context,listen: false).setDigitval(suggestion.toString());
      },
    )
    ;
  }
}

