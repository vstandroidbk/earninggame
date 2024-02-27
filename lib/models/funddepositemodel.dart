class FundDepositeModel {
  String? msg;
  bool? status;
  List<Result>? result;

  FundDepositeModel({this.msg, this.status, this.result});

  FundDepositeModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add( Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? userId;
  String? amount;
  String? txRequestNumber;
  String? txnId;
  String? txnRef;
  String? insertDate;
  String? fundStatus;
  String? depositType;
  String? rejectRemark;

  Result(
      {this.id,
        this.userId,
        this.amount,
        this.txRequestNumber,
        this.txnId,
        this.txnRef,
        this.insertDate,
        this.fundStatus,
        this.depositType,
        this.rejectRemark});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    txRequestNumber = json['tx_request_number'];
    txnId = json['txn_id'];
    txnRef = json['txn_ref'];
    insertDate = json['insert_date'];
    fundStatus = json['fund_status'];
    depositType = json['deposit_type'];
    rejectRemark = json['reject_remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['tx_request_number'] = txRequestNumber;
    data['txn_id'] = txnId;
    data['txn_ref'] = txnRef;
    data['insert_date'] = insertDate;
    data['fund_status'] = fundStatus;
    data['deposit_type'] = depositType;
    data['reject_remark'] = rejectRemark;
    return data;
  }
}
