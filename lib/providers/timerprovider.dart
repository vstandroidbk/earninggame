import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  int sec = 30;
  String timeLeft = "00:00";
  Timer? timer;
  String startTimer() {
    sec = 30;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      sec--;
      Duration durationSec = Duration(seconds: sec);
      timeLeft = "${durationSec.toString().split(".")[0]} ";

      notifyListeners();
      if (durationSec.toString().split(".")[0].toString() == "0:00:00") {
        timer.cancel();
      }
    });
    return timeLeft;
  }
}
