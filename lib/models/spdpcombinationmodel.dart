class SpnDpCombiModel {
  List<PosssibleArray>? posssibleArray;
  int? totalBidAmount;
  int? walletAmtAfterBid;
  bool? status;

  SpnDpCombiModel(
      {this.posssibleArray,
        this.totalBidAmount,
        this.walletAmtAfterBid,
        this.status});

  SpnDpCombiModel.fromJson(Map<String, dynamic> json) {
    if (json['posssible_array'] != null) {
      posssibleArray = <PosssibleArray>[];
      json['posssible_array'].forEach((v) {
        posssibleArray!.add(new PosssibleArray.fromJson(v));
      });
    }
    totalBidAmount = json['total_bid_amount'];
    walletAmtAfterBid = json['wallet_amt_after_bid'];
    status = json['status'];
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

  PosssibleArray({this.number, this.points});

  PosssibleArray.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['points'] = points;
    return data;
  }
}
