import 'package:ecommerce_ostad/features/product/data/models/product_list_model.dart';

class CartModel {
  int? code;
  String? status;
  String? msg;
  ProductListModel? data;

  CartModel({this.code, this.status, this.msg, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ProductListModel.fromJson(json['data']) : null;
  }
}


