import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class KingStarlineBidHistoryUi extends StatefulWidget {
  const KingStarlineBidHistoryUi({super.key});

  @override
  State<KingStarlineBidHistoryUi> createState() =>
      _KingStarlineBidHistoryUiState();
}

class _KingStarlineBidHistoryUiState extends State<KingStarlineBidHistoryUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: clrTranaparent,
        foregroundColor: blackClr,
        title: const Text("King Starline Bid History"),
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
