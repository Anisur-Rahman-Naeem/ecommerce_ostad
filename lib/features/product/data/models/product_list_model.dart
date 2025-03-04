import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';

class ProductListModel {
  List<ProductDetailsModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  ProductListModel(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  ProductListModel.fromJson(Map<String, dynamic> json) {
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
