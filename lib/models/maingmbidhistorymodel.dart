class MainGmBidHistoryModel {
  List<BidData>? bidData;
  String? msg;
  bool? status;

  MainGmBidHistoryModel({this.bidData, this.msg, this.status});

  MainGmBidHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['bid_data'] != null) {
      bidData = <BidData>[];
      json['bid_data'].forEach((v) {
        bidData!.add(BidData.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bidData != null) {
      data['bid_data'] = bidData!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class BidData {
  String? gameName;
  String? pana;
  String? session;
  String? digits;
  String? closedigits;
  String? points;
  String? bidTxId;
  String? bidDate;

  BidData(
      {this.gameName,
        this.pana,
        this.session,
        this.digits,
        this.closedigits,
        this.points,
        this.bidTxId,
        this.bidDate});

  BidData.fromJson(Map<String, dynamic> json) {
    gameName = json['game_name'];
    pana = json['pana'];
    session = json['session'];
    digits = json['digits'];
    closedigits = json['closedigits'];
    points = json['points'];
    bidTxId = json['bid_tx_id'];
    bidDate = json['bid_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_name'] = gameName;
    data['pana'] = pana;
    data['session'] = session;
    data['digits'] = digits;
    data['closedigits'] = closedigits;
    data['points'] = points;
    data['bid_tx_id'] = bidTxId;
    data['bid_date'] = bidDate;
    return data;
  }
}
