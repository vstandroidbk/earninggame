import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class FundDepositHistoryUi extends StatefulWidget {
  const FundDepositHistoryUi({super.key});

  @override
  State<FundDepositHistoryUi> createState() => _FundDepositHistoryUiState();
}

class _FundDepositHistoryUiState extends State<FundDepositHistoryUi> {
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
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
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
                                  Text("18/12/2023 03:22:45 AM",
                                      style: TextStyle(color: primaryColor)),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        child: Image.asset(
                                            "assets/images/Clockk.png"),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Pending",
                                        style: TextStyle(color: primaryColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Table(
                                columnWidths: const {0: FlexColumnWidth(0.7)},
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "\u{20B9} 500.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: primaryColor),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Order ID"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "jmt-Qcaypk5VLZLjQ3",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
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
                                columnWidths: const {0: FlexColumnWidth(0.7)},
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
