import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';

class BankDetailsUi extends StatefulWidget {
  const BankDetailsUi({super.key});

  @override
  State<BankDetailsUi> createState() => _BankDetailsUiState();
}

class _BankDetailsUiState extends State<BankDetailsUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("Bank Details"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 100,
            child: Image.asset("assets/demoimages/demoicon.png"),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: clrWhite,
                boxShadow: [BoxShadow(color: greyClr, blurRadius: 8)]),
            child: Column(
              children: [
                Table(
                  columnWidths: const {1: FixedColumnWidth(20)},
                  children: const [
                    TableRow(children: [
                      Text("Account Holder Name  "),
                      Text(":"),
                      Text(" Ram "),
                    ]),
                    TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ]),
                    TableRow(children: [
                      Text("Bank Name  "),
                      Text(":"),
                      Text("State Bank of India VAISHALI NAGAR J. "),
                    ]),
                    TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ]),
                    TableRow(children: [
                      Text("Account Number "),
                      Text(":"),
                      Text("012203043 "),
                    ]),
                    TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ]),
                    TableRow(children: [
                      Text("IFSC Code"),
                      Text(":"),
                      Text("SBIN0031438 "),
                    ]),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: double.infinity,
                    child: customElevatedButton(context, "CHANGE BANK", () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.zero,
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      color: primaryColor,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: const Text(
                                        "Alert",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            height: 70,
                                            child: Image.asset(
                                                "assets/demoimages/warningsign.png"),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                            "₹ 5.0 will be chargeable for changing account number",
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: customElevatedButton(
                                                    context, "PROCEED", () {
                                                  Navigator.pop(context);
                                                }),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: customElevatedButton(
                                                    context, "CANCEL", () {
                                                  Navigator.pop(context);
                                                }),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
