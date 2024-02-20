class FundWithdrawModel {
  String? withdrawOpenTime;
  String? withdrawCloseTime;
  List<Withdrawdata>? withdrawdata;
  String? lastRequestStatus;
  String? msg;
  bool? status;
  String? walletAmt;

  FundWithdrawModel(
      {this.withdrawOpenTime,
        this.withdrawCloseTime,
        this.withdrawdata,
        this.lastRequestStatus,
        this.msg,
        this.status,
        this.walletAmt});

  FundWithdrawModel.fromJson(Map<String, dynamic> json) {
    withdrawOpenTime = json['withdraw_open_time'];
    withdrawCloseTime = json['withdraw_close_time'];
    if (json['withdrawdata'] != null) {
      withdrawdata = <Withdrawdata>[];
      json['withdrawdata'].forEach((v) {
        withdrawdata!.add(new Withdrawdata.fromJson(v));
      });
    }
    lastRequestStatus = json['last_request_status'];
    msg = json['msg'];
    status = json['status'];
    walletAmt = json['wallet_amt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['withdraw_open_time'] = withdrawOpenTime;
    data['withdraw_close_time'] = withdrawCloseTime;
    if (withdrawdata != null) {
      data['withdrawdata'] = withdrawdata!.map((v) => v.toJson()).toList();
    }
    data['last_request_status'] = lastRequestStatus;
    data['msg'] = msg;
    data['status'] = status;
    data['wallet_amt'] = walletAmt;
    return data;
  }
}

class Withdrawdata {
  String? withdrawRequestId;
  String? requestAmount;
  String? requestNumber;
  String? requestStatus;
  String? paymentMethod;
  String? vpaId;
  String? paytmNumber;
  String? googlePayNumber;
  String? phonePayNumber;
  String? remark;
  String? paymentReceipt;
  String? insertDate;

  Withdrawdata(
      {this.withdrawRequestId,
        this.requestAmount,
        this.requestNumber,
        this.requestStatus,
        this.paymentMethod,
        this.vpaId,
        this.paytmNumber,
        this.googlePayNumber,
        this.phonePayNumber,
        this.remark,
        this.paymentReceipt,
        this.insertDate});

  Withdrawdata.fromJson(Map<String, dynamic> json) {
    withdrawRequestId = json['withdraw_request_id'];
    requestAmount = json['request_amount'];
    requestNumber = json['request_number'];
    requestStatus = json['request_status'];
    paymentMethod = json['payment_method'];
    vpaId = json['vpa_id'];
    paytmNumber = json['paytm_number'];
    googlePayNumber = json['google_pay_number'];
    phonePayNumber = json['phone_pay_number'];
    remark = json['remark'];
    paymentReceipt = json['payment_receipt'];
    insertDate = json['insert_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['withdraw_request_id'] = withdrawRequestId;
    data['request_amount'] = requestAmount;
    data['request_number'] = requestNumber;
    data['request_status'] = requestStatus;
    data['payment_method'] = paymentMethod;
    data['vpa_id'] = vpaId;
    data['paytm_number'] = paytmNumber;
    data['google_pay_number'] = googlePayNumber;
    data['phone_pay_number'] = phonePayNumber;
    data['remark'] = remark;
    data['payment_receipt'] = paymentReceipt;
    data['insert_date'] = insertDate;
    return data;
  }
}
