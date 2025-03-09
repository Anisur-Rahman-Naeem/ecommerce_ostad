import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';

class ProductDetailsDataReceiverModel {
  int? code;
  String? status;
  String? msg;
  ProductDetailsModel? data;

  ProductDetailsDataReceiverModel({this.code, this.status, this.msg, this.data});

  ProductDetailsDataReceiverModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ProductDetailsModel.fromJson(json['data']) : null;
  }
}