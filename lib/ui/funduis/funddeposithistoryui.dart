import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/funddepositemodel.dart';
import '../../providers/fundprovider/withdrawfundprovider.dart';
import '../../utils/colors.dart';

class FundDepositHistoryUi extends StatefulWidget {
  const FundDepositHistoryUi({super.key});

  @override
  State<FundDepositHistoryUi> createState() => _FundDepositHistoryUiState();
}

class _FundDepositHistoryUiState extends State<FundDepositHistoryUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<WithdrawFundProvider>(context, listen: false)
        .fundDepositeApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("Fund Deposit History"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<WithdrawFundProvider>(
                      builder: (context, withdrawFundProvider, child) {
                    return withdrawFundProvider.isDepositedataLoding
                        ? const CustomCircularProgress()
                        : withdrawFundProvider
                                    .getFundDepositeData.result.length <=
                                0
                            ?const SizedBox(height:500,child: Center(child:  Text("No Data Found",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)))
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: withdrawFundProvider
                                    .getFundDepositeData.result.length,
                                itemBuilder: (context, index) {
                                  Result data=  withdrawFundProvider
                                      .getFundDepositeData.result[index];
                                  return Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(color: greyClr, blurRadius: 8)
                                    ], color: clrWhite),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(data.insertDate??"--",
                                                style: TextStyle(
                                                    color: primaryColor)),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  child:data.fundStatus=="0"? Image.asset(
                                                      "assets/images/Clockk.png",color:data.fundStatus=="0"?primaryColor:clrBlackLight ,):
                                                  data.fundStatus=="1"?Icon(Icons.dangerous,color: clrRed,) :
                                                  Icon(Icons.done_all,color: clrGreen,)
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  data.fundStatus=="0"?"Pending":data.fundStatus=="1"?"Rejected":data.fundStatus=="2"?"Accepted":"--",
                                                  style: TextStyle(
                                                      color:data.fundStatus=="0"? primaryColor:data.fundStatus=="1"?clrRed:data.fundStatus=="2"?clrGreen:blackClr),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Table(
                                          columnWidths: const {
                                            0: FlexColumnWidth(0.7)
                                          },
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                "\u{20B9} ${data.amount??"--"}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color: primaryColor),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children:  [
                                                 const Text("Transaction ID"),//Order ID
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    data.txnId??"--",
                                                    style:const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ])
                                          ],
                                        ),
                                        Divider(
                                          color: greyClr,
                                        ),
                                        Table(
                                          columnWidths: const {
                                            0: FlexColumnWidth(0.7)
                                          },
                                          children: const [
                                            TableRow(children: [
                                              Text("Request Type"),
                                              Text("Deposit Mode"),
                                            ]),
                                            TableRow(
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ],
                                            ),
                                            TableRow(children: [
                                              Text(
                                                "Credit",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "UPI / Bank",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
