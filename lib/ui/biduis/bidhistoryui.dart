import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class BidHistoryUi extends StatefulWidget {
  const BidHistoryUi({super.key});

  @override
  State<BidHistoryUi> createState() => _BidHistoryUiState();
}

class _BidHistoryUiState extends State<BidHistoryUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
        title: const Text("King Jackpot Bid History"),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
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
                            const Text("By Game Type"),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(value: true, onChanged: (val) {}),
                                    const Text("OPEN")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(value: true, onChanged: (val) {}),
                                    const Text("CLOSE")
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                                  itemCount: 20,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      // padding: const EdgeInsets.symmetric(
                                      //     horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: greyLightClr,
                                        // borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: true, onChanged: (val) {}),
                                          const Text("LATA MORNING")
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
                                  child: customElevatedButton(
                                      context, "Set Filter", () {}),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: customElevatedButton(
                                      context, "Cancel Filter", () {
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
            },
            child: const Icon(
              Icons.filter_alt_outlined,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Container(
                            decoration: BoxDecoration(
                                color: clrWhite,
                                boxShadow: [
                                  BoxShadow(color: greyClr, blurRadius: 8)
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                  ),
                                  child: const Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "MADHUR DAY(close)",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "Game Type",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "Single Digit",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          "Digits",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "8",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          "Points",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "3",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: greyClr,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "Bid Id",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "Tbsj9087d",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          "Bid Date",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "12/12/2023",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                  color: greyClr,
                                ),
                                const Center(
                                  child: Text(
                                    "Transaction Time : 13/12/2023 02:18:14 PM",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Divider(
                                  color: greyClr,
                                ),
                                Center(
                                  child: Text(
                                    "Congratulation , You won(28) ",
                                    style: TextStyle(
                                        color: clrGreen, fontSize: 12),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                )
                              ],
                            ),
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
