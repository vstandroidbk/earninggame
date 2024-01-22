class WithdrawMethodListGetModel {
  String? mobileNo;
  List<Result>? result;
  String? minAmt;
  String? msg;
  bool? status;

  WithdrawMethodListGetModel(
      {this.mobileNo, this.result, this.minAmt, this.msg, this.status});

  WithdrawMethodListGetModel.fromJson(Map<String, dynamic> json) {
    mobileNo = json['mobile_no'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    minAmt = json['min_amt'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_no'] = mobileNo;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['min_amt'] = minAmt;
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class Result {
  int? type;
  String? value;
  String? name;

  Result({this.type, this.value, this.name});

  Result.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    data['name'] = name;
    return data;
  }
}
