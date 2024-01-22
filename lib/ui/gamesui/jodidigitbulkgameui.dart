import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/gameuiproviders/jodidigitbulkprovider.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class JodiDigitBulkGameUi extends StatefulWidget {
  const JodiDigitBulkGameUi({super.key});

  @override
  State<JodiDigitBulkGameUi> createState() => _JodiDigitBulkGameUiState();
}

class _JodiDigitBulkGameUiState extends State<JodiDigitBulkGameUi> {
  TextEditingController singleDigitController = TextEditingController();
  TextEditingController pointController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<JodiDigitBulkGameProvider>(context, listen: false)
          .removeAllBids();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComman(const Text("Jodi Digit Bulk Game")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Jodi",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(color: greyClr, blurRadius: 8),
                        // ], borderRadius: BorderRadius.circular(20)),
                        child: customInputFieldPin(singleDigitController,
                            TextInputType.number, context,
                            maxlength: 2, textalign: true),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Point",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 190,
                      child: Container(
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(color: greyClr, blurRadius: 8),
                        // ], borderRadius: BorderRadius.circular(20)),
                        child: customInputFieldPin(
                            pointController, TextInputType.number, context,
                            maxlength: 6, textalign: true),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 190,
                    child: customElevatedButton(
                      context,
                      "Add",
                      () {
                        if (singleDigitController.text.isEmpty) {
                          customSnackbar(context, "Please enter jodi");
                        } else if (pointController.text.isEmpty) {
                          customSnackbar(context, "Please enter points");
                        } else {
                          Provider.of<JodiDigitBulkGameProvider>(context,
                                  listen: false)
                              .addTotalBids(singleDigitController.text,
                                  pointController.text);
                          singleDigitController.clear();
                          pointController.clear();
                        }
                      },
                      horizontalPadding: 10.0,
                      verticalPadding: 10.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Table(
            columnWidths: const {
              // 0: FixedColumnWidth(110),
              // 1: FixedColumnWidth(110),
              // 2: FixedColumnWidth(110),
              // 3: FixedColumnWidth(110)
            },
            children: const [
              TableRow(children: [
                TableCell(
                    child: Center(
                        child: Text(
                  "jodi",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),
                TableCell(
                    child: Center(
                        child: Text(
                  "Points",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),
                TableCell(
                    child: Center(
                        child: Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ))),
                TableCell(child: Center(child: Text(""))),
              ])
            ],
          ),
          Divider(
            color: greyClr,
            thickness: 2,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<JodiDigitBulkGameProvider>(
                  builder: (context, jodiDigitBulkGameProvider, child) {
                    List<TableRow> tablerow = [];
                    List<Map> totalBids = jodiDigitBulkGameProvider.totalBids;
                    List.generate(totalBids.length, (index) {
                      return tablerow.add(TableRow(
                          decoration:
                              BoxDecoration(color: clrWhite, boxShadow: [
                            BoxShadow(color: greyClr, blurRadius: 4),
                          ]),
                          children: [
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index]['jodi']}"),
                            ))),
                            TableCell(
                                child: Center(
                                    child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${totalBids[index]['points']}"),
                            ))),
                            const TableCell(child: Center()),
                            TableCell(
                                child: InkWell(
                              onTap: () {
                                Provider.of<JodiDigitBulkGameProvider>(context,
                                        listen: false)
                                    .removeBids(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete_forever,
                                  color: clrRed,
                                ),
                              ),
                            )),
                          ]));
                    });
                    return Table(
                      columnWidths: const {
                        // 0: FixedColumnWidth(110),
                        // 1: FixedColumnWidth(110),
                        // 2: FixedColumnWidth(110),
                        // 3: FixedColumnWidth(110)
                      },
                      children: tablerow,
                    );
                  },
                )
              ],
            ),
          )),
          Divider(
            thickness: 2,
            color: primaryColor,
          ),
          Consumer<JodiDigitBulkGameProvider>(
            builder: (context, jodiDigitBulkGameProvider, child) {
              int totalpoints = 0;
              List<Map> totalBids = jodiDigitBulkGameProvider.totalBids;
              List.generate(totalBids.length, (index) {
                int points = int.parse(totalBids[index]['points'].toString());
                totalpoints += points;
              });
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("Bids"),
                      Text("${jodiDigitBulkGameProvider.totalBids.length}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Points"),
                      Text("$totalpoints"),
                    ],
                  ),
                  SizedBox(
                      width: 100,
                      child: customElevatedButton(
                        context,
                        "Submit",
                        () {
                          return popupWorkingMoneyReduction(context, () {
                            Navigator.pop(context);
                            popUpInsufficientBalance(context);
                          });
                        },
                        verticalPadding: 3.0,
                      ))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
