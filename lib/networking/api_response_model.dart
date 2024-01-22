class ApiResponseModel {
  String? status;
  String? message;
  List<Data>? data;

  ApiResponseModel({this.status, this.message, this.data});

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? resData;
  String? resKey;

  Data({this.resData, this.resKey});

  Data.fromJson(Map<String, dynamic> json) {
    resData = json['resData'];
    resKey = json['resKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resData'] = resData;
    data['resKey'] = resKey;
    return data;
  }
}
