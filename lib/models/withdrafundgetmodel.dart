class WithdraFundGetModel {
  String? walletAmt;
  String? holdAmt;
  String? transferPointStatus;
  String? minBidAmount;
  String? maxBidAmount;
  String? minWithdrawal;
  String? maxWithdrawal;
  String? minTransfer;
  String? maxTransfer;
  String? withdrawOpenTime;
  String? withdrawCloseTime;
  String? msg;
  bool? status;

  WithdraFundGetModel(
      {this.walletAmt,
        this.holdAmt,
        this.transferPointStatus,
        this.minBidAmount,
        this.maxBidAmount,
        this.minWithdrawal,
        this.maxWithdrawal,
        this.minTransfer,
        this.maxTransfer,
        this.withdrawOpenTime,
        this.withdrawCloseTime,
        this.msg,
        this.status});

  WithdraFundGetModel.fromJson(Map<String, dynamic> json) {
    walletAmt = json['wallet_amt'];
    holdAmt = json['hold_amt'];
    transferPointStatus = json['transfer_point_status'];
    minBidAmount = json['min_bid_amount'];
    maxBidAmount = json['max_bid_amount'];
    minWithdrawal = json['min_withdrawal'];
    maxWithdrawal = json['max_withdrawal'];
    minTransfer = json['min_transfer'];
    maxTransfer = json['max_transfer'];
    withdrawOpenTime = json['withdraw_open_time'];
    withdrawCloseTime = json['withdraw_close_time'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wallet_amt'] = walletAmt;
    data['hold_amt'] = holdAmt;
    data['transfer_point_status'] = transferPointStatus;
    data['min_bid_amount'] = minBidAmount;
    data['max_bid_amount'] = maxBidAmount;
    data['min_withdrawal'] = minWithdrawal;
    data['max_withdrawal'] = maxWithdrawal;
    data['min_transfer'] = minTransfer;
    data['max_transfer'] = maxTransfer;
    data['withdraw_open_time'] = withdrawOpenTime;
    data['withdraw_close_time'] = withdrawCloseTime;
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}
