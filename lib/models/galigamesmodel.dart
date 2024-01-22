class GaliGamesModel {
  String? msg;
  int? msgStatus;
  bool? status;
  String? webGalidessarChartUrl;
  List<Result>? result;

  GaliGamesModel(
      {this.msg,
      this.msgStatus,
      this.status,
      this.webGalidessarChartUrl,
      this.result});

  GaliGamesModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    msgStatus = json['msg_status'];
    status = json['status'];
    webGalidessarChartUrl = json['web_galidessar_chart_url'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['msg_status'] = msgStatus;
    data['status'] = status;
    data['web_galidessar_chart_url'] = webGalidessarChartUrl;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? gameId;
  String? gameName;
  String? gameNameHindi;
  String? openTime;
  String? openTimeSort;
  String? closeTime;
  String? msg;
  int? msgStatus;
  String? openResult;
  String? closeResult;

  Result(
      {this.gameId,
      this.gameName,
      this.gameNameHindi,
      this.openTime,
      this.openTimeSort,
      this.closeTime,
      this.msg,
      this.msgStatus,
      this.openResult,
      this.closeResult});

  Result.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    gameName = json['game_name'];
    gameNameHindi = json['game_name_hindi'];
    openTime = json['open_time'];
    openTimeSort = json['open_time_sort'];
    closeTime = json['close_time'];
    msg = json['msg'];
    msgStatus = json['msg_status'];
    openResult = json['open_result'];
    closeResult = json['close_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_id'] = gameId;
    data['game_name'] = gameName;
    data['game_name_hindi'] = gameNameHindi;
    data['open_time'] = openTime;
    data['open_time_sort'] = openTimeSort;
    data['close_time'] = closeTime;
    data['msg'] = msg;
    data['msg_status'] = msgStatus;
    data['open_result'] = openResult;
    data['close_result'] = closeResult;
    return data;
  }
}
