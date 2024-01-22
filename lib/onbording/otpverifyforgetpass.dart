// import 'package:earninggame/onbording/loginui.dart';
// import 'package:earninggame/onbording/setpinui.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../utils/colors.dart';
// import '../utils/components.dart';

// class CreateAccountUi extends StatefulWidget {
//   String mobileNo;
//   CreateAccountUi({super.key, required this.mobileNo});

//   @override
//   State<CreateAccountUi> createState() => _CreateAccountUiState();
// }

// class _CreateAccountUiState extends State<CreateAccountUi> {
//   TextEditingController userNameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 Container(
//                   width: 20,
//                   height: 65,
//                   color: primaryColor,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "CREATE YOUR NEW \n ACCOUNT ",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 24,
//                       color: blackClr,
//                       letterSpacing: 0.8),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Center(
//               child: SizedBox(
//                   width: 300,
//                   child: Image.asset("assets/images/pngtree-mobile.png")),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Enter username",
//                     style: TextStyle(fontSize: 15, color: blackClr),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   customInputField(userNameController, TextInputType.text),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       const Text("Already have an account? "),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.push(context,
//                                 CupertinoPageRoute(builder: (context) {
//                               return const LoginUi();
//                             }));
//                           },
//                           child: Text(
//                             "Login",
//                             style: TextStyle(color: primaryColor),
//                           ))
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: customElevatedButton(context, "Next", () {
//                       Navigator.push(context,
//                           CupertinoPageRoute(builder: (context) {
//                         return SetPinUi(
//                           mobNo: widget.mobileNo.toString(),
//                         );
//                       }));
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
