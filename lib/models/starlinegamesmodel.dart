class StarlineGamesModel {
  String? msg;
  int? msgStatus;
  bool? status;
  String? webStarlineChartUrl;
  List<Result>? result;

  StarlineGamesModel(
      {this.msg,
      this.msgStatus,
      this.status,
      this.webStarlineChartUrl,
      this.result});

  StarlineGamesModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    msgStatus = json['msg_status'];
    status = json['status'];
    webStarlineChartUrl = json['web_starline_chart_url'];
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
    data['web_starline_chart_url'] = webStarlineChartUrl;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? gameId;
  String? gameName;
  String? openTime;
  String? openTimeSort;
  String? msg;
  int? msgStatus;
  String? openResult;

  Result(
      {this.gameId,
      this.gameName,
      this.openTime,
      this.openTimeSort,
      this.msg,
      this.msgStatus,
      this.openResult});

  Result.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    gameName = json['game_name'];
    openTime = json['open_time'];
    openTimeSort = json['open_time_sort'];
    msg = json['msg'];
    msgStatus = json['msg_status'];
    openResult = json['open_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_id'] = gameId;
    data['game_name'] = gameName;
    data['open_time'] = openTime;
    data['open_time_sort'] = openTimeSort;
    data['msg'] = msg;
    data['msg_status'] = msgStatus;
    data['open_result'] = openResult;
    return data;
  }
}
