import 'package:earninggame/providers/passbookprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:earninggame/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/passbookmodel.dart';

class PassbookUi extends StatefulWidget {
  const PassbookUi({super.key});

  @override
  State<PassbookUi> createState() => _PassbookUiState();
}

class _PassbookUiState extends State<PassbookUi> {

  List<Map> tableData = [
    {
      "date": "21-12-2023",
      "particulars": "Bid (MILAN DAY : Single Digit : OPEN ) : 4",
      "previous": "\u{20B9} 500",
      "transaction": "+ \u{20B9} 100",
      "current": "\u{20B9} 600"
    },

  ];
  @override
  void initState() {
    super.initState();
    Provider.of<PassbookProvider>(context,listen: false).passbookApiCalling(context);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Passbook"),
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Consumer<PassbookProvider>(builder: (context,passbookProvider,child){
                final tableraw = <TableRow>[];
                tableraw.add(TableRow(
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    children: const [
                      TableCell(
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Transaction Date"),
                              ))),
                      TableCell(
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Particulars"),
                              ))),
                      TableCell(
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Previous Amount"),
                              ))),
                      TableCell(
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Transaction Amount"),
                              ))),
                      TableCell(
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Current amount"),
                              )))
                    ]));
                List dataApi=passbookProvider.passbookData.transactionHistory??[];
                for (TransactionHistory data in dataApi) {
                  tableraw.add(TableRow(children: [
                    TableCell(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(data.insertDate??"__"),
                                  // const Text("08:20 PM"),
                                ],
                              ),
                            ))),
                    TableCell(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.transactionNote??"--"),
                            ))),
                    TableCell(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.previousAmount??"--"),
                            ))),
                    TableCell(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${data.transactionType=="2"?"-":"+"} ${data.amount}"??"--",style: TextStyle(color:data.transactionType=="2"? clrRed:clrGreen),),
                            ))),
                    TableCell(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.currentAmount??"--"),
                            )))
                  ]));
                }
                return passbookProvider.islodingData?
                const SizedBox(width:double.maxFinite,height: double.maxFinite,
                    child: Center(child:  CircularProgressIndicator()))
                    : Row(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Table(
                        border: TableBorder.all(color: greyLightClr, width: 2),
                        // defaultColumnWidth: const FixedColumnWidth(200.0),
                        columnWidths: const {
                          0: FixedColumnWidth(150),
                          1: FixedColumnWidth(350),
                          2: FixedColumnWidth(250),
                          3: FixedColumnWidth(200),
                          4: FixedColumnWidth(150),
                        },
                        children: tableraw),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
