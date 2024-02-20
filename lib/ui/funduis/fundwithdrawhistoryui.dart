import 'package:earninggame/ui/components/circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/fundwithdrawmodel.dart';
import '../../providers/fundprovider/withdrawfundprovider.dart';
import '../../utils/colors.dart';

class FundWithdrawHistoryUi extends StatefulWidget {
  const FundWithdrawHistoryUi({super.key});

  @override
  State<FundWithdrawHistoryUi> createState() => _FundWithdrawHistoryUiState();
}

class _FundWithdrawHistoryUiState extends State<FundWithdrawHistoryUi> {
  @override
  void initState() {
    super.initState();
    Provider.of<WithdrawFundProvider>(context,listen: false).withdrawGetHistoryApiCall(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("Fund Withdraw History"),
      ),
      body: Consumer<WithdrawFundProvider>(builder:(context,withdrawFundProvider,child){
        return withdrawFundProvider.isHistoryLoding?const CustomCircularProgress() : SizedBox(
          width: double.maxFinite,
          child: ListView.builder(itemCount: withdrawFundProvider.getWithdrawHistory.withdrawdata.length,shrinkWrap:true,itemBuilder: (context,index){
            Withdrawdata data = withdrawFundProvider.getWithdrawHistory.withdrawdata[index];
            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
              decoration: BoxDecoration(
                  color: clrWhite,
                  boxShadow: [BoxShadow(color: greyLightClr,blurRadius: 1)]
              ),
              child: Column(
                children: [
                  Text("${data.insertDate}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount : ${data.requestAmount} "),
                      Text("Status : ")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Method : "),
                      Text("Status : ")
                    ],
                  )
                ],
              ) ,

            );
          }),
        )
        ;
      }));
  }
}
