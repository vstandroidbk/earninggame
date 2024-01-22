import 'package:earninggame/providers/maingameresultprovider.dart';
import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/maingameresultmodel.dart';
import '../../utils/colors.dart';

class GamesResultUi extends StatefulWidget {
  const GamesResultUi({super.key});

  @override
  State<GamesResultUi> createState() => _GamesResultUiState();
}

class _GamesResultUiState extends State<GamesResultUi> {
  DateTime nowDate = DateTime.now();
  late String dateToday;
  String? selectedDate;
  @override
  void initState() {
    super.initState();
    dateToday = DateFormat("yyyy-MM-dd").format(nowDate);
    Provider.of<MainGameResultProvider>(context, listen: false)
        .getGaliRatesApiCall(context, selectedDate ?? dateToday);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
        title: const Text("Result History"),
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
                          Provider.of<MainGameResultProvider>(context,
                                  listen: false)
                              .getGaliRatesApiCall(
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
          Expanded(child: Consumer<MainGameResultProvider>(
            builder: (context, mainGameResultProvider, child) {
              List<GameResult>? gameData =
                  mainGameResultProvider.galiGmRatesData?.gameResult;
              return mainGameResultProvider.isloading
                  ? const CustomCircularProgress()
                  : ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: gameData?.length ?? 0,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 20),
                      // separatorBuilder: (context, index) {
                      //   return
                      // },
                      itemBuilder: (context, index) {
                        GameResult? resultData = gameData?[index];
                        return Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: clrWhite,
                                boxShadow: [
                                  BoxShadow(color: primaryColor, blurRadius: 2)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${resultData?.gameName}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: primaryColor),
                                ),
                                Text(
                                  "${resultData?.gameResult}",
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
          )),
        ],
      )),
    );
  }
}
