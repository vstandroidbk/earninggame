import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';

class KingJackpotBidHistoryUi extends StatefulWidget {
  const KingJackpotBidHistoryUi({super.key});

  @override
  State<KingJackpotBidHistoryUi> createState() =>
      _KingJackpotBidHistoryUiState();
}

class _KingJackpotBidHistoryUiState extends State<KingJackpotBidHistoryUi> {
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
              customFilter(context);
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/demoimages/no-image.png"),
            const Text("No bids Found")
          ],
        ),
      ),
    );
  }
}
