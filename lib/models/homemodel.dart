class HomeModel {
  String? appLink;
  String? shareMsg;
  int? withdrawStatus;
  String? appMaintainenceMsg;
  String? maintainenceMsgStatus;
  String? userCurrentVersion;
  String? userMinimumVersion;
  String? popStatus;
  String? message;
  String? link;
  String? linkBtnText;
  String? actionType;
  String? actionBtnText;
  String? appDate;
  String? walletAmt;
  String? bettingStatus;
  String? transferPointStatus;
  String? accountBlockStatus;
  List<Result>? result;
  String? mobileNo;
  String? msg;
  bool? status;

  HomeModel(
      {this.appLink,
        this.shareMsg,
        this.withdrawStatus,
        this.appMaintainenceMsg,
        this.maintainenceMsgStatus,
        this.userCurrentVersion,
        this.userMinimumVersion,
        this.popStatus,
        this.message,
        this.link,
        this.linkBtnText,
        this.actionType,
        this.actionBtnText,
        this.appDate,
        this.walletAmt,
        this.bettingStatus,
        this.transferPointStatus,
        this.accountBlockStatus,
        this.result,
        this.mobileNo,
        this.msg,
        this.status});

  HomeModel.fromJson(Map<String, dynamic> json) {
    appLink = json['app_link'];
    shareMsg = json['share_msg'];
    withdrawStatus = json['withdraw_status'];
    appMaintainenceMsg = json['app_maintainence_msg'];
    maintainenceMsgStatus = json['maintainence_msg_status'];
    userCurrentVersion = json['user_current_version'];
    userMinimumVersion = json['user_minimum_version'];
    popStatus = json['pop_status'];
    message = json['message'];
    link = json['link'];
    linkBtnText = json['link_btn_text'];
    actionType = json['action_type'];
    actionBtnText = json['action_btn_text'];
    appDate = json['app_date'];
    walletAmt = json['wallet_amt'];
    bettingStatus = json['betting_status'];
    transferPointStatus = json['transfer_point_status'];
    accountBlockStatus = json['account_block_status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    mobileNo = json['mobile_no'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_link'] = appLink;
    data['share_msg'] = shareMsg;
    data['withdraw_status'] = withdrawStatus;
    data['app_maintainence_msg'] = appMaintainenceMsg;
    data['maintainence_msg_status'] = maintainenceMsgStatus;
    data['user_current_version'] = userCurrentVersion;
    data['user_minimum_version'] = userMinimumVersion;
    data['pop_status'] = popStatus;
    data['message'] = message;
    data['link'] = link;
    data['link_btn_text'] = linkBtnText;
    data['action_type'] = actionType;
    data['action_btn_text'] = actionBtnText;
    data['app_date'] = appDate;
    data['wallet_amt'] = walletAmt;
    data['betting_status'] = bettingStatus;
    data['transfer_point_status'] = transferPointStatus;
    data['account_block_status'] = accountBlockStatus;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['mobile_no'] = mobileNo;
    data['msg'] = msg;
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
  int? msgStatus;
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
        this.msgStatus,
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
    msgStatus = json['msg_status'];
    openResult = json['open_result'];
    closeResult = json['close_result'];
    closeDuration = json['close_duration'];
    timeSrt = json['time_srt'];
    webChartUrl = json['web_chart_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['close_duration'] = closeDuration;
    data['time_srt'] = timeSrt;
    data['web_chart_url'] = webChartUrl;
    return data;
  }
}
