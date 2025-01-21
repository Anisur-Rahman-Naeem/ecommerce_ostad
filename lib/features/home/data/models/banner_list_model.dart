import 'package:ecommerce_ostad/features/home/data/models/BannerModel.dart';

class BannerListModel {
  String? msg;
  List<BannerModel>? bannerList;

  BannerListModel({this.msg, this.bannerList});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerList = <BannerModel>[];
      json['data'].forEach((v) {
        bannerList!.add(BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    if (bannerList != null) {
      data['data'] = bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

