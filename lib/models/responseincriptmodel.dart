class ResponseIncriptModel {
  Data? data;

  ResponseIncriptModel({this.data});

  ResponseIncriptModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? resdata;
  String? reskey;

  Data({this.resdata, this.reskey});

  Data.fromJson(Map<String, dynamic> json) {
    resdata = json['resdata'];
    reskey = json['reskey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resdata'] = resdata;
    data['reskey'] = reskey;
    return data;
  }
}
