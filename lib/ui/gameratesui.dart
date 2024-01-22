import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/gameratesmodel.dart';
import '../providers/gamesratesprovider.dart';
import '../utils/colors.dart';

class GameRatesUi extends StatefulWidget {
  const GameRatesUi({super.key});

  @override
  State<GameRatesUi> createState() => _GameRatesUiState();
}

class _GameRatesUiState extends State<GameRatesUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<GameRatesProvider>(context, listen: false)
        .gameRatesApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: blackClr,
        title: const Text("Game Rates"),
      ),
      body: SafeArea(child: Consumer<GameRatesProvider>(
        builder: (context, gameRatesProvider, child) {
          GameRates? gameRatesa =
              gameRatesProvider.getGameRatesData?.gameRates?[0];
          StartlieGameRates? starlineRates =
              gameRatesProvider.getGameRatesData?.startlieGameRates?[0];
          GaliGameRates? galiRates =
              gameRatesProvider.getGameRatesData?.galiGameRates?[0];
          return gameRatesProvider.isloading
              ? const CustomCircularProgress()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  "Game Rates",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Single Digit :- ${gameRatesa?.singleDigitVal1} - ${gameRatesa?.singleDigitVal2}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Jodi Digit :- ${gameRatesa?.jodiDigitVal1} - ${gameRatesa?.jodiDigitVal2}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Single Pana :- ${gameRatesa?.singlePanaVal1} - ${gameRatesa?.singlePanaVal2}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Double Pana :- ${gameRatesa?.doublePanaVal1} - ${gameRatesa?.doublePanaVal2}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Triple Pana :- ${gameRatesa?.tripplePanaVal1} - ${gameRatesa?.tripplePanaVal2}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Half Sangam :- ${gameRatesa?.halfSangamVal1} - ${gameRatesa?.halfSangamVal2}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Full Sangam :- ${gameRatesa?.fullSangamVal1} - ${gameRatesa?.fullSangamVal2}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  "Starline Game Rates",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Single Digit :- ${starlineRates?.singleDigitVal1} - ${starlineRates?.singleDigitVal2} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Single Pana :- ${starlineRates?.singlePanaVal1} - ${starlineRates?.singlePanaVal2} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Double Pana :- ${starlineRates?.doublePanaVal1} - ${starlineRates?.doublePanaVal2} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Triple Pana :- ${starlineRates?.tripplePanaVal1} - ${starlineRates?.tripplePanaVal2} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  "Gali Game Rates",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Single Digit :- ${galiRates?.singleDigitVal1} - ${galiRates?.singleDigitVal2} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Single Pana :- ${galiRates?.singlePanaVal1} - ${galiRates?.singlePanaVal2} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: greyClr, blurRadius: 8)
                                  ],
                                  color: greyLightClr,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Double Pana :- ${galiRates?.doublePanaVal1} - ${galiRates?.doublePanaVal2} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      )),
    );
  }
}
