import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';

class ExtractingWishlists {
  List<WishList>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  ExtractingWishlists(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  ExtractingWishlists.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <WishList>[];
      json['results'].forEach((v) {
        results!.add(WishList.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}


class WishList {
  String? sId;
  ProductDetailsModel? product;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WishList(
      {this.sId,
        this.product,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.iV});

  WishList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
    json['product'] != null ? ProductDetailsModel.fromJson(json['product']) : null;
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
