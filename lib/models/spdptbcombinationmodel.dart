class SpDpTpCombModel {
  List<PosssibleArray>? posssibleArray;
  int? totalBidAmount;
  int? walletAmtAfterBid;
  bool? status;
  String? msg;

  SpDpTpCombModel(
      {this.posssibleArray,
      this.totalBidAmount,
      this.walletAmtAfterBid,
      this.msg,
      this.status});

  SpDpTpCombModel.fromJson(Map<String, dynamic> json) {
    if (json['posssible_array'] != null) {
      posssibleArray = <PosssibleArray>[];
      json['posssible_array'].forEach((v) {
        posssibleArray!.add(PosssibleArray.fromJson(v));
      });
    }
    totalBidAmount = json['total_bid_amount'];
    walletAmtAfterBid = json['wallet_amt_after_bid'];
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posssibleArray != null) {
      data['posssible_array'] =
          posssibleArray!.map((v) => v.toJson()).toList();
    }
    data['total_bid_amount'] = totalBidAmount;
    data['wallet_amt_after_bid'] = walletAmtAfterBid;
    data['status'] = status;
    return data;
  }
}

class PosssibleArray {
  String? number;
  String? points;
  String? pana;

  PosssibleArray({this.number, this.points, this.pana});

  PosssibleArray.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    points = json['points'];
    pana = json['pana'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['points'] = points;
    data['pana'] = pana;
    return data;
  }
}
