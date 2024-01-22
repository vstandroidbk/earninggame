class HomeModel {
  String? msg;
  int? msgStatus;
  List<Result>? result;
  String? mobileNo;
  bool? status;

  HomeModel(
      {this.msg, this.msgStatus, this.result, this.mobileNo, this.status});

  HomeModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    msgStatus = json['msg_status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    mobileNo = json['mobile_no'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['msg_status'] = msgStatus;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['mobile_no'] = mobileNo;
    data['status'] = status;
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
  String? openResult;
  String? closeResult;
  int? closeDuration;
  int? timeSrt;
  String? webChartUrl;

  Result(
      {this.gameId,
      this.gameName,
      this.gameNameHindi,
      this.openTime,
      this.openTimeSort,
      this.closeTime,
      this.msg,
      this.openResult,
      this.closeResult,
      this.closeDuration,
      this.timeSrt,
      this.webChartUrl});

  Result.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    gameName = json['game_name'];
    gameNameHindi = json['game_name_hindi'];
    openTime = json['open_time'];
    openTimeSort = json['open_time_sort'];
    closeTime = json['close_time'];
    msg = json['msg'];
    openResult = json['open_result'];
    closeResult = json['close_result'];
    closeDuration = json['close_duration'];
    timeSrt = json['time_srt'];
    webChartUrl = json['web_chart_url'];
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
    data['open_result'] = openResult;
    data['close_result'] = closeResult;
    data['close_duration'] = closeDuration;
    data['time_srt'] = timeSrt;
    data['web_chart_url'] = webChartUrl;
    return data;
  }
}
