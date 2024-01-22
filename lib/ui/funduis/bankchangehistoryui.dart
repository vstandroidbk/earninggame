import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class BankChangeHistoryUi extends StatefulWidget {
  const BankChangeHistoryUi({super.key});

  @override
  State<BankChangeHistoryUi> createState() => _BankChangeHistoryUiState();
}

class _BankChangeHistoryUiState extends State<BankChangeHistoryUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("Bank Change History"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: clrWhite,
                      boxShadow: [BoxShadow(color: greyClr, blurRadius: 8)]),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          color: primaryColor,
                          child: const Center(
                              child: Text(
                            "Currently Active",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ))),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Table(
                              children: [
                                TableRow(children: [
                                  const Text("18/12/2023 03:22:45 AM"),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.verified_outlined,
                                        color: clrGreen,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text("Verified Bank Details")
                                    ],
                                  )
                                ])
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Divider(
                              color: greyClr,
                            ),
                            Table(
                              children: const [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text("Account Number"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text("Account Holder Name"),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    child: Text(
                                      "611400568000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    child: Text("Shri Ram",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                  ),
                                ])
                              ],
                            ),
                            Divider(
                              color: greyClr,
                            ),
                            Table(
                              children: const [
                                TableRow(children: [
                                  Text("Bank Name"),
                                  Text("Account Holder Name"),
                                ]),
                                TableRow(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    "State Bank of India ,\n VAISHALI NAGAR JA",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Text("Shri Ram",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ])
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
