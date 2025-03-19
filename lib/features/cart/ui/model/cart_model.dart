import 'package:ecommerce_ostad/features/cart/ui/model/cart_list_model.dart';

class CartModel {
  int? code;
  String? status;
  String? msg;
  CartList? data;

  CartModel({this.code, this.status, this.msg, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? CartList.fromJson(json['data']) : null;
  }
}

