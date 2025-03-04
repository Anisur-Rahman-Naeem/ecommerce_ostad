
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_model.dart';

class ProductListModel {
  String? msg;
  List<ProductDetailsModel>? productList;

  ProductListModel({this.msg, this.productList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        productList!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }
}