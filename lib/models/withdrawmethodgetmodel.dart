class WithdrawMethodGetModel {
  List<Upidata>? upidata;
  bool? status;

  WithdrawMethodGetModel({this.upidata, this.status});

  WithdrawMethodGetModel.fromJson(Map<String, dynamic> json) {
    if (json['upidata'] != null) {
      upidata = <Upidata>[];
      json['upidata'].forEach((v) {
        upidata!.add(Upidata.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (upidata != null) {
      data['upidata'] = upidata!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Upidata {
  String? paytmNumber;
  String? googlePayNumber;
  String? phonePayNumber;
  String? vpaId;

  Upidata(
      {this.paytmNumber,
      this.googlePayNumber,
      this.phonePayNumber,
      this.vpaId});

  Upidata.fromJson(Map<String, dynamic> json) {
    paytmNumber = json['paytm_number'];
    googlePayNumber = json['google_pay_number'];
    phonePayNumber = json['phone_pay_number'];
    vpaId = json['vpa_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paytm_number'] = paytmNumber;
    data['google_pay_number'] = googlePayNumber;
    data['phone_pay_number'] = phonePayNumber;
    data['vpa_id'] = vpaId;
    return data;
  }
}
