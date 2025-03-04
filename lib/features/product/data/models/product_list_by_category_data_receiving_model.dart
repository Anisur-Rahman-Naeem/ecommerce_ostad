import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';

class ProductListbyCategoryDataReceivingModel {
  int? code;
  String? status;
  String? msg;
  ProductListbyCategoryDataExtractingFromResultsModel? data;

  ProductListbyCategoryDataReceivingModel({this.code, this.status, this.msg, this.data});

  ProductListbyCategoryDataReceivingModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ProductListbyCategoryDataExtractingFromResultsModel.fromJson(json['data']) : null;
  }
}

class ProductListbyCategoryDataExtractingFromResultsModel {
  List<ProductDetailsModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  ProductListbyCategoryDataExtractingFromResultsModel(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  ProductListbyCategoryDataExtractingFromResultsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ProductDetailsModel>[];
      json['results'].forEach((v) {
        results!.add(ProductDetailsModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}

