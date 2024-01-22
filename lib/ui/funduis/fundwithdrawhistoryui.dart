import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class FundWithdrawHistoryUi extends StatefulWidget {
  const FundWithdrawHistoryUi({super.key});

  @override
  State<FundWithdrawHistoryUi> createState() => _FundWithdrawHistoryUiState();
}

class _FundWithdrawHistoryUiState extends State<FundWithdrawHistoryUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("Fund Withdraw History"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/demoimages/no-image.png"),
            const Text("No Withdraw History Found")
          ],
        ),
      ),
    );
  }
}
