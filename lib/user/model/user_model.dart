class UserInfoModel {
  int? code;
  String? status;
  String? msg;
  User? data;

  UserInfoModel({this.code, this.status, this.msg, this.data});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  String? phone;
  bool? phoneVerified;
  String? avatarUrl;
  String? city;
  int? role;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerified,
        this.phone,
        this.phoneVerified,
        this.avatarUrl,
        this.city,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerified = json['email_verified'];
    phone = json['phone'];
    phoneVerified = json['phone_verified'];
    avatarUrl = json['avatar_url'];
    city = json['city'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
