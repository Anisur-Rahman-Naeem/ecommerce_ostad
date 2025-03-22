
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';

class CartList {
  List<CartItem>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  CartList(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  CartList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CartItem>[];
      json['results'].forEach((v) {
        results!.add(CartItem.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}

class CartItem {
  String? sId;
  ProductDetailsModel? product;
  String? user;
  int? quantity;
  List<String>? color;
  List<String>? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartItem(
      {this.sId,
        this.product,
        this.user,
        this.quantity,
        this.color,
        this.size,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CartItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'] != null ? ProductDetailsModel.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}