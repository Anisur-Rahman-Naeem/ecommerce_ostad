import 'package:ecommerce_ostad/features/wishlist/ui/models/wishlist_extraction.dart';

class WishListModel {
  int? code;
  String? status;
  String? msg;
  ExtractingWishlists? data;

  WishListModel({this.code, this.status, this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ExtractingWishlists.fromJson(json['data']) : null;
  }
}