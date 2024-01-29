import 'dart:developer';

import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/withdrafundgetmodel.dart';
import '../../models/withdrawmethodlistmodel.dart';
import '../../providers/fundprovider/withdramethodprovider.dart';
import '../../providers/fundprovider/withdrawfundprovider.dart';
import '../../providers/profileprovider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';
import 'package:intl/intl.dart';

class WithdrawFundUi extends StatefulWidget {
  const WithdrawFundUi({super.key});

  @override
  State<WithdrawFundUi> createState() => _WithdrawFundUiState();
}

class _WithdrawFundUiState extends State<WithdrawFundUi> {
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<WithDrawMethodProvider>(context, listen: false)
        .withdrawMethodgetApiCall(context);
    Provider.of<WithDrawMethodProvider>(context, listen: false)
        .setdropValue(null);
    Provider.of<WithdrawFundProvider>(context, listen: false)
        .withdrawGetWalletApiCall(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: clrTranaparent,
          elevation: 0,
          foregroundColor: blackClr,
          title: const Text("Withdraw Fund"),
          actions: [
            SizedBox(
                width: 25, child: Image.asset("assets/demoimages/wallet.png")),
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
            ),
          ],
        ),
        body: Consumer<WithDrawMethodProvider>(
          builder: (context, withDrawMethodProvider, child) {
            WithdrawMethodListGetModel modeldata =
                withDrawMethodProvider.withdrawMethodList;
            return withDrawMethodProvider.isWithdrawMethodloading
                ? const CustomCircularProgress()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(color: greyClr, blurRadius: 8)
                                ], color: clrWhite),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      width: double.infinity,
                                      color: greyClr,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Krishan ram",
                                            style: TextStyle(
                                                color: clrWhite,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            modeldata.mobileNo??"----------",
                                            style: TextStyle(
                                                color: clrWhite,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons
                                                .account_balance_wallet_outlined,
                                            size: 45,
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Consumer<ProfileProvider>(
                                                  builder: (context,
                                                      profileProvider, child) {
                                                    return Text(
                                                      "${profileProvider.profileModelData.profile?[0].walletBalance}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18),
                                                    );
                                                  },
                                                ),
                                                const Text("Current Balance")
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              child: Image.asset(
                                                  "assets/demoimages/cricle.png"))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(color: greyClr, blurRadius: 8)
                                ], color: clrWhite),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      width: 300,
                                      child: Text(
                                        "Call or WhatsApp for Withdraw Related Queries",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 30),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 0,
                                          ),
                                          SizedBox(
                                            width: 50,
                                            child: Image.asset(
                                                "assets/demoimages/whatsapp.png"),
                                          ),
                                          const SizedBox(
                                            width: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                modeldata.whatsappNo ??
                                                    '----------',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17),
                                              ),
                                              Consumer<WithdrawFundProvider>(
                                                builder: (context,
                                                    withdrawFundProvider,
                                                    child) {
                                                  DateTime startTime;
                                                  String? opentime;
                                                  String? openClose;
                                                  WithdraFundGetModel modelData;
                                                  if (withdrawFundProvider
                                                          .isLoding ==
                                                      false) {
                                                    try {

                                                      modelData =
                                                          withdrawFundProvider
                                                              .withdrawGetWelletData;

                                                     DateTime now=DateTime.now();
                                                     String todayDate=DateFormat("yyyy-MM-dd").format(now);

                                                      String timeOpen =
                                                          "$todayDate ${modelData.withdrawOpenTime}:00";
                                                      String timeClose =
                                                          "$todayDate ${modelData.withdrawCloseTime}:00";
                                                      startTime =DateTime.parse("$timeOpen");
                                                       opentime=DateFormat("hh:mm a").format(startTime);
                                                       openClose=DateFormat("hh:mm a").format(DateTime.parse("$timeClose"));
                                                    } catch (e) {
                                                      log(e.toString());
                                                      // customSnackbar(context,
                                                      //     e.toString());
                                                    }
                                                  }
                                                  return withdrawFundProvider
                                                          .isLoding
                                                      ? const Text("---")
                                                      : withdrawFundProvider
                                                              .isLoding
                                                          ? const CustomCircularProgress()
                                                          :  Text(
                                                              "${opentime ?? '---'} ~ ${openClose ?? '---'}",
                                                              style:const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 17),
                                                            );
                                                },
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Withdraw Amount",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              customInputField(
                                  amountController, TextInputType.number,
                                  hintText: "Enter Amount"),
                              const SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField(
                                isExpanded: true,
                                hint: const Text("Select Withdraw Method"),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  filled: true,
                                  fillColor: greyLightClr,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide
                                          .none), //, borderRadius: BorderRadius.circular(20)
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide
                                          .none), //, borderRadius: BorderRadius.circular(20)
                                ),
                                value: withDrawMethodProvider.dropValue,
                                items: modeldata.result?.map((e) {
                                  return DropdownMenuItem(
                                    value: e.type,
                                    child: Text("${e.name}"),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  withDrawMethodProvider.setdropValue(val);
                                },
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Consumer<WithdrawFundProvider>(
                                builder:
                                    (context, withdrawFundProvider, child) {
                                  return withdrawFundProvider.isLoding
                                      ? const CustomCircularProgress()
                                      : SizedBox(
                                          width: double.infinity,
                                          child: customElevatedButton(
                                              context, "SEND REQUEST", () {


                                            Map<String, dynamic> reqData = {
                                              "env_type": Constants.envType,
                                              "user_id": idUser,
                                              "request_amount":
                                                  amountController.text,
                                              "payment_method":
                                                  withDrawMethodProvider
                                                      .dropValue
                                            };


                                            bool startTimeOpen=true;
                                            bool closeTimeOpen=true;
                                            WithdraFundGetModel modelData =
                                                withdrawFundProvider
                                                    .withdrawGetWelletData;

                                              try {
                                                DateTime now=DateTime.now();
                                                String todayDate=DateFormat("yyyy-MM-dd").format(now);
                                                String timeOpen =
                                                    "$todayDate ${modelData.withdrawOpenTime}:00";
                                                String timeClose =
                                                    "$todayDate ${modelData.withdrawCloseTime}:00";

                                               DateTime startTime =DateTime.parse("$timeOpen");
                                               DateTime closeTime =DateTime.parse("$timeClose");

                                                if(startTime.isAfter(DateTime.now())){
                                                  startTimeOpen=false;
                                                }else{
                                                  startTimeOpen=true;
                                                }

                                                if(closeTime.isAfter(DateTime.now())){
                                                  closeTimeOpen=true;
                                                }else{
                                                  closeTimeOpen=false;
                                                }
                                                print("startTimeOpen=$startTimeOpen closeTimeOpen=$closeTimeOpen");
                                              } catch (e) {
                                                log(e.toString());
                                              }

                                            if (amountController.text.isEmpty) {
                                              customSnackbar(context,
                                                  "Amount is required.");
                                            }  else if (int.parse(
                                                    modelData.minWithdrawal!) >
                                                int.parse(
                                                    amountController.text)) {
                                              customSnackbar(context,
                                                  "Min ${modelData.minWithdrawal} amount is required.");
                                            }else if(startTimeOpen==false){
                                              customSnackbar(context,
                                                  "You can't request before request time period.");
                                            }else if(closeTimeOpen==false){
                                              customSnackbar(context,
                                                  "You can't request after request time period.");
                                            }else if(startTimeOpen==false){
                                              customSnackbar(context,
                                                  "You can't request before request time.");
                                            } else if (withDrawMethodProvider
                                                .dropValue ==
                                                null) {
                                              customSnackbar(context,
                                                  "Please select Payment method");
                                            } else if (int.parse(
                                                    modelData.maxWithdrawal!) <
                                                int.parse(
                                                    amountController.text)) {
                                              customSnackbar(context,
                                                  "Maximum ${modelData.maxWithdrawal} amount can be withdraws.");
                                            } else {
                                              log("${ProfileProvider.getamount }============");
                                              if(ProfileProvider.getamount < int.parse(amountController.text.toString())){
                                                  customSnackbar(context, "Insufficient balance .");
                                              }else{
                                                Provider.of<WithDrawMethodProvider>(context,listen: false).setdropValue(null);
                                                amountController.clear();
                                                Provider.of<WithDrawMethodProvider>(
                                                        context,
                                                        listen: false)
                                                    .checkPendReqApiCall(
                                                        context, reqData);
                                              }

                                            }
                                          }));
                                },
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }
}
