import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/fundwithdrawmodel.dart';
import '../../providers/fundprovider/withdrawfundprovider.dart';
import '../../utils/colors.dart';

class FundWithdrawHistoryUi extends StatefulWidget {
  const FundWithdrawHistoryUi({super.key});

  @override
  State<FundWithdrawHistoryUi> createState() => _FundWithdrawHistoryUiState();
}

class _FundWithdrawHistoryUiState extends State<FundWithdrawHistoryUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<WithdrawFundProvider>(context, listen: false)
        .withdrawGetHistoryApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: clrTranaparent,
          elevation: 0,
          foregroundColor: blackClr,
          title: const Text("Fund Withdraw History"),
        ),
        body: Consumer<WithdrawFundProvider>(
            builder: (context, withdrawFundProvider, child) {
          return withdrawFundProvider.isHistoryLoding
              ? const CustomCircularProgress()
              : withdrawFundProvider.getWithdrawHistory.withdrawdata.length <= 0
                  ? const Center(
                      child: Text(
                      "No Data Found",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ))
                  : SizedBox(
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: withdrawFundProvider
                              .getWithdrawHistory.withdrawdata.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Withdrawdata data = withdrawFundProvider
                                .getWithdrawHistory.withdrawdata[index];
                            return Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 5),
                              decoration:
                                  BoxDecoration(color: clrWhite, boxShadow: [
                                BoxShadow(color: greyLightClr, blurRadius: 1)
                              ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data.insertDate}",
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Amount : ${data.requestAmount} "),
                                      Row(
                                        children: [
                                          const Text("Status :"),
                                          Text(
                                            data.requestStatus.toString().trim() == "0" ? "Pending" : data.requestStatus.toString().trim() == "2" ? "Accepted" : data.requestStatus.toString().trim() == "1" ? "Rejected" : "--",
                                            style: TextStyle(
                                                color: data.requestStatus == "0"
                                                    ? primaryColor
                                                    : data.requestStatus == "1"
                                                        ? clrRed
                                                        : data.requestStatus ==
                                                                "2"
                                                            ? clrGreen
                                                            : blackClr),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Payment No/Id : ${data.paymentMethod.toString().trim() == "1" ? data.vpaId : data.paymentMethod == "2" ? data.paytmNumber : data.paymentMethod == "3" ? data.googlePayNumber : data.paymentMethod == "4" ? data.phonePayNumber : "Somethiing went wrong"}"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "Payment Method : ${data.paymentMethod == "1" ? "VPA" : data.paymentMethod == "2" ? "Paytm" : data.paymentMethod == "3" ? "Google pay" : data.paymentMethod == "4" ? "Phone Pay" : "Something went wrong"} ")
                                ],
                              ),
                            );
                          }),
                    );
        }));
  }
}
