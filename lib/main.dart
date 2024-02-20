import 'package:earninggame/onbording/splashui.dart';
import 'package:earninggame/providers/createuserprovider.dart';
import 'package:earninggame/providers/forgetpassprovider.dart';
import 'package:earninggame/providers/fundprovider/withdramethodprovider.dart';
import 'package:earninggame/providers/fundprovider/withdrawfundprovider.dart';
import 'package:earninggame/providers/gamesratesprovider.dart';
import 'package:earninggame/providers/gameuiproviders/gdgamesprovider.dart';
import 'package:earninggame/providers/gameuiproviders/halfsangramprovider.dart';
import 'package:earninggame/providers/gameuiproviders/jodidigitbulkprovider.dart';
import 'package:earninggame/providers/gameuiproviders/jodidigitproviderrr.dart';
import 'package:earninggame/providers/gameuiproviders/maingamesprovider.dart';
import 'package:earninggame/providers/gameuiproviders/singledigitbulkprovider.dart';
import 'package:earninggame/providers/gameuiproviders/singledigitprovider.dart';
import 'package:earninggame/providers/gameuiproviders/singlepanaprovider.dart';
import 'package:earninggame/providers/gameuiproviders/slgamesprovider.dart';
import 'package:earninggame/providers/gameuiproviders/spdptpprovider.dart';
import 'package:earninggame/providers/homeprovider.dart';
import 'package:earninggame/providers/kingjackpotprovider.dart';
import 'package:earninggame/providers/loginprovider.dart';
import 'package:earninggame/providers/maingameresultprovider.dart';
import 'package:earninggame/providers/numberprovider.dart';
import 'package:earninggame/providers/otpcheckprovider.dart';
import 'package:earninggame/providers/otpprovider.dart';
import 'package:earninggame/providers/otprequestprovider.dart';
import 'package:earninggame/providers/permissionprovider.dart';
import 'package:earninggame/providers/profileprovider.dart';
import 'package:earninggame/providers/starlinegameresultprovider.dart';
import 'package:earninggame/providers/starlinegamesprovider.dart';
import 'package:earninggame/providers/timerProvider.dart';
import 'package:earninggame/providers/updatepassprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NumberProvider()),
      ChangeNotifierProvider(create: (_) => HalfSangram()),
      ChangeNotifierProvider(create: (_) => SpDpTpProvider()),
      ChangeNotifierProvider(create: (_) => MainGamesProvider()),
      ChangeNotifierProvider(create: (_) => GdGamesProvider()),
      ChangeNotifierProvider(create: (_) => SlGameProvider()),
      ChangeNotifierProvider(create: (_) => WithDrawMethodProvider()),
      ChangeNotifierProvider(create: (_) => WithdrawFundProvider()),
      ChangeNotifierProvider(create: (_) => StarlineGmResultProvider()),
      ChangeNotifierProvider(create: (_) => MainGameResultProvider()),
      ChangeNotifierProvider(create: (_) => GaliProvider()),
      ChangeNotifierProvider(create: (_) => StarlineGamesProvider()),
      ChangeNotifierProvider(create: (_) => GameRatesProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => UpdatePassProvider()),
      ChangeNotifierProvider(create: (_) => OtpCheckProvider()),
      ChangeNotifierProvider(create: (_) => ForgetPassProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => CreateUserProvider()),
      ChangeNotifierProvider(create: (_) => OtpProvider()),
      ChangeNotifierProvider(create: (_) => OtpRequestProvider()),
      ChangeNotifierProvider(create: (_) => PermissionProvider()),
      ChangeNotifierProvider(create: (_) => TimerProvider()),
      ChangeNotifierProvider(create: (_) => SingleDigitGameProvider()),
      ChangeNotifierProvider(create: (_) => SingleDigitBulkGameProvider()),
      ChangeNotifierProvider(create: (_) => JodiDigitGameProvider()),
      ChangeNotifierProvider(create: (_) => JodiDigitBulkGameProvider()),
      ChangeNotifierProvider(create: (_) => SinglePanaGameProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Earning Game',
      theme: ThemeData(
        fontFamily: 'Poppins',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashUi(),
    );
  }
}
