class StarlineGameRatesModel {
  List<GameRates>? gameRates;
  String? msg;
  bool? status;

  StarlineGameRatesModel({this.gameRates, this.msg, this.status});

  StarlineGameRatesModel.fromJson(Map<String, dynamic> json) {
    if (json['game_rates'] != null) {
      gameRates = <GameRates>[];
      json['game_rates'].forEach((v) {
        gameRates!.add(GameRates.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gameRates != null) {
      data['game_rates'] = gameRates!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class GameRates {
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

  GameRates(
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

  GameRates.fromJson(Map<String, dynamic> json) {
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
