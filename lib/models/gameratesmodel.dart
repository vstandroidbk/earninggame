class GameRatesModel {
  List<GameRates>? gameRates;
  List<StartlieGameRates>? startlieGameRates;
  List<GaliGameRates>? galiGameRates;
  bool? status;

  GameRatesModel(
      {this.gameRates,
      this.startlieGameRates,
      this.galiGameRates,
      this.status});

  GameRatesModel.fromJson(Map<String, dynamic> json) {
    if (json['game_rates'] != null) {
      gameRates = <GameRates>[];
      json['game_rates'].forEach((v) {
        gameRates!.add(GameRates.fromJson(v));
      });
    }
    if (json['startlie_game_rates'] != null) {
      startlieGameRates = <StartlieGameRates>[];
      json['startlie_game_rates'].forEach((v) {
        startlieGameRates!.add(StartlieGameRates.fromJson(v));
      });
    }
    if (json['gali_game_rates'] != null) {
      galiGameRates = <GaliGameRates>[];
      json['gali_game_rates'].forEach((v) {
        galiGameRates!.add(GaliGameRates.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gameRates != null) {
      data['game_rates'] = gameRates!.map((v) => v.toJson()).toList();
    }
    if (startlieGameRates != null) {
      data['startlie_game_rates'] =
          startlieGameRates!.map((v) => v.toJson()).toList();
    }
    if (galiGameRates != null) {
      data['gali_game_rates'] = galiGameRates!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class GameRates {
  String? gameRateId;
  String? singleDigitVal1;
  String? singleDigitVal2;
  String? jodiDigitVal1;
  String? jodiDigitVal2;
  String? singlePanaVal1;
  String? singlePanaVal2;
  String? doublePanaVal1;
  String? doublePanaVal2;
  String? tripplePanaVal1;
  String? tripplePanaVal2;
  String? halfSangamVal1;
  String? halfSangamVal2;
  String? fullSangamVal1;
  String? fullSangamVal2;
  String? insertDate;

  GameRates(
      {this.gameRateId,
      this.singleDigitVal1,
      this.singleDigitVal2,
      this.jodiDigitVal1,
      this.jodiDigitVal2,
      this.singlePanaVal1,
      this.singlePanaVal2,
      this.doublePanaVal1,
      this.doublePanaVal2,
      this.tripplePanaVal1,
      this.tripplePanaVal2,
      this.halfSangamVal1,
      this.halfSangamVal2,
      this.fullSangamVal1,
      this.fullSangamVal2,
      this.insertDate});

  GameRates.fromJson(Map<String, dynamic> json) {
    gameRateId = json['game_rate_id'];
    singleDigitVal1 = json['single_digit_val_1'];
    singleDigitVal2 = json['single_digit_val_2'];
    jodiDigitVal1 = json['jodi_digit_val_1'];
    jodiDigitVal2 = json['jodi_digit_val_2'];
    singlePanaVal1 = json['single_pana_val_1'];
    singlePanaVal2 = json['single_pana_val_2'];
    doublePanaVal1 = json['double_pana_val_1'];
    doublePanaVal2 = json['double_pana_val_2'];
    tripplePanaVal1 = json['tripple_pana_val_1'];
    tripplePanaVal2 = json['tripple_pana_val_2'];
    halfSangamVal1 = json['half_sangam_val_1'];
    halfSangamVal2 = json['half_sangam_val_2'];
    fullSangamVal1 = json['full_sangam_val_1'];
    fullSangamVal2 = json['full_sangam_val_2'];
    insertDate = json['insert_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_rate_id'] = gameRateId;
    data['single_digit_val_1'] = singleDigitVal1;
    data['single_digit_val_2'] = singleDigitVal2;
    data['jodi_digit_val_1'] = jodiDigitVal1;
    data['jodi_digit_val_2'] = jodiDigitVal2;
    data['single_pana_val_1'] = singlePanaVal1;
    data['single_pana_val_2'] = singlePanaVal2;
    data['double_pana_val_1'] = doublePanaVal1;
    data['double_pana_val_2'] = doublePanaVal2;
    data['tripple_pana_val_1'] = tripplePanaVal1;
    data['tripple_pana_val_2'] = tripplePanaVal2;
    data['half_sangam_val_1'] = halfSangamVal1;
    data['half_sangam_val_2'] = halfSangamVal2;
    data['full_sangam_val_1'] = fullSangamVal1;
    data['full_sangam_val_2'] = fullSangamVal2;
    data['insert_date'] = insertDate;
    return data;
  }
}

class StartlieGameRates {
  String? gameRateId;
  String? singleDigitVal1;
  String? singleDigitVal2;
  String? singlePanaVal1;
  String? singlePanaVal2;
  String? doublePanaVal1;
  String? doublePanaVal2;
  String? tripplePanaVal1;
  String? tripplePanaVal2;
  String? insertDate;

  StartlieGameRates(
      {this.gameRateId,
      this.singleDigitVal1,
      this.singleDigitVal2,
      this.singlePanaVal1,
      this.singlePanaVal2,
      this.doublePanaVal1,
      this.doublePanaVal2,
      this.tripplePanaVal1,
      this.tripplePanaVal2,
      this.insertDate});

  StartlieGameRates.fromJson(Map<String, dynamic> json) {
    gameRateId = json['game_rate_id'];
    singleDigitVal1 = json['single_digit_val_1'];
    singleDigitVal2 = json['single_digit_val_2'];
    singlePanaVal1 = json['single_pana_val_1'];
    singlePanaVal2 = json['single_pana_val_2'];
    doublePanaVal1 = json['double_pana_val_1'];
    doublePanaVal2 = json['double_pana_val_2'];
    tripplePanaVal1 = json['tripple_pana_val_1'];
    tripplePanaVal2 = json['tripple_pana_val_2'];
    insertDate = json['insert_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_rate_id'] = gameRateId;
    data['single_digit_val_1'] = singleDigitVal1;
    data['single_digit_val_2'] = singleDigitVal2;
    data['single_pana_val_1'] = singlePanaVal1;
    data['single_pana_val_2'] = singlePanaVal2;
    data['double_pana_val_1'] = doublePanaVal1;
    data['double_pana_val_2'] = doublePanaVal2;
    data['tripple_pana_val_1'] = tripplePanaVal1;
    data['tripple_pana_val_2'] = tripplePanaVal2;
    data['insert_date'] = insertDate;
    return data;
  }
}

class GaliGameRates {
  String? gameRateId;
  String? singleDigitVal1;
  String? singleDigitVal2;
  String? singlePanaVal1;
  String? singlePanaVal2;
  String? doublePanaVal1;
  String? doublePanaVal2;
  String? insertDate;

  GaliGameRates(
      {this.gameRateId,
      this.singleDigitVal1,
      this.singleDigitVal2,
      this.singlePanaVal1,
      this.singlePanaVal2,
      this.doublePanaVal1,
      this.doublePanaVal2,
      this.insertDate});

  GaliGameRates.fromJson(Map<String, dynamic> json) {
    gameRateId = json['game_rate_id'];
    singleDigitVal1 = json['single_digit_val_1'];
    singleDigitVal2 = json['single_digit_val_2'];
    singlePanaVal1 = json['single_pana_val_1'];
    singlePanaVal2 = json['single_pana_val_2'];
    doublePanaVal1 = json['double_pana_val_1'];
    doublePanaVal2 = json['double_pana_val_2'];
    insertDate = json['insert_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_rate_id'] = gameRateId;
    data['single_digit_val_1'] = singleDigitVal1;
    data['single_digit_val_2'] = singleDigitVal2;
    data['single_pana_val_1'] = singlePanaVal1;
    data['single_pana_val_2'] = singlePanaVal2;
    data['double_pana_val_1'] = doublePanaVal1;
    data['double_pana_val_2'] = doublePanaVal2;
    data['insert_date'] = insertDate;
    return data;
  }
}
