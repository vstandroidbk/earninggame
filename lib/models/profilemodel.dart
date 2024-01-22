class ProfileModel {
  List<Profile>? profile;
  String? msg;
  bool? status;

  ProfileModel({this.profile, this.msg, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['profile'] != null) {
      profile = <Profile>[];
      json['profile'].forEach((v) {
        profile!.add(Profile.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class Profile {
  String? walletBalance;
  String? userName;
  String? email;
  String? mobile;

  Profile({this.walletBalance, this.userName, this.email, this.mobile});

  Profile.fromJson(Map<String, dynamic> json) {
    walletBalance = json['wallet_balance'];
    userName = json['user_name'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wallet_balance'] = walletBalance;
    data['user_name'] = userName;
    data['email'] = email;
    data['mobile'] = mobile;
    return data;
  }
}
