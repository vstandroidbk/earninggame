import 'package:earninggame/providers/starlinegameresultprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/starlinegameresultmodel.dart';
import '../../utils/colors.dart';

class KingStarlineResultHistoryUi extends StatefulWidget {
  const KingStarlineResultHistoryUi({super.key});

  @override
  State<KingStarlineResultHistoryUi> createState() =>
      _KingStarlineResultHistoryUiState();
}

class _KingStarlineResultHistoryUiState
    extends State<KingStarlineResultHistoryUi> {
  DateTime nowDate = DateTime.now();
  late String dateToday;
  @override
  void initState() {
    super.initState();
    dateToday = DateFormat("yyyy-MM-dd").format(nowDate);
    Provider.of<StarlineGmResultProvider>(context, listen: false)
        .starlineGmResultApiCall(context, selectedDate ?? dateToday);
  }

  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
        title: const Text("King Starline Result History"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select Date :"),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.parse(selectedDate ?? dateToday),
                          firstDate: DateTime(2001),
                          lastDate: DateTime.now(),
                          builder: (context, childs) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: primaryColor,
                                colorScheme:
                                    ColorScheme.light(primary: primaryColor),
                                buttonTheme: const ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary),
                              ),
                              child: childs!,
                            );
                          },
                        );

                        if (pickedDate != null) {
                          setState(() {
                            selectedDate =
                                DateFormat("yyyy-MM-dd").format(pickedDate);
                          });
                          Provider.of<StarlineGmResultProvider>(context,
                                  listen: false)
                              .starlineGmResultApiCall(
                                  context, selectedDate ?? dateToday);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: greyClr, blurRadius: 10)
                            ]),
                        child: Text(
                          selectedDate ?? dateToday,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(child: Consumer<StarlineGmResultProvider>(
            builder: (context, starlineGmResultProvider, child) {
              List<GameResult>? resultData =
                  starlineGmResultProvider.starlineGmResultData?.gameResult;
              return starlineGmResultProvider.isloading
                  ? const CustomCircularProgress()
                  : starlineGmResultProvider.starlineGmResultData?.status ==
                          false
                      ? const Center(
                          child: Text("No Data Found ."),
                        )
                      : ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: resultData?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            GameResult? data = resultData?[index];
                            return Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: clrWhite,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: primaryColor, blurRadius: 2)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data?.gameName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: primaryColor),
                                    ),
                                    Text(
                                      "${data?.gameResult}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
            },
          ))
        ],
      )),
    );
  }
}
