import 'package:earninggame/utils/colors.dart';
import 'package:earninggame/utils/components.dart';
import 'package:flutter/material.dart';

class AddFundUi extends StatefulWidget {
  const AddFundUi({super.key});

  @override
  State<AddFundUi> createState() => _AddFundUiState();
}

class _AddFundUiState extends State<AddFundUi> {
  TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Provider.of<WithdrawFundProvider>(context, listen: false)
    //     .withdrawFundGetApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrTranaparent,
        elevation: 0,
        foregroundColor: blackClr,
        title: const Text("Add Fund"),
        actions: [
          SizedBox(
              width: 25, child: Image.asset("assets/demoimages/wallet.png")),
          const SizedBox(
            width: 5,
          ),
          const Center(
            child: Text(
              "500.00",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: greyClr, blurRadius: 8)],
                        color: clrWhite),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          color: greyClr,
                          child: Column(
                            children: [
                              Text(
                                "Krishan ram",
                                style: TextStyle(
                                    color: clrWhite,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "8828700284",
                                style: TextStyle(
                                    color: clrWhite,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.account_balance_wallet_outlined,
                                size: 45,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("\u{20B9} 500"),
                                    Text("Current Balance")
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Image.asset(
                                      "assets/demoimages/cricle.png"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Add Fund",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customInputField(amountController, TextInputType.number,
                      hintText: "Enter Amount"),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: customElevatedButton(context, "ADD CASH", () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                contentPadding: EdgeInsets.zero,
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                          width: 100,
                                          child: Image.asset(
                                              "assets/demoimages/Pass.png")),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                          "Your Payment Added Successfully."),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 10),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: customElevatedButton(
                                              context, "Ok", () {
                                            Navigator.pop(context);
                                          }),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      })),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
