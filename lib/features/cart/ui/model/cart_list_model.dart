import 'package:ecommerce_ostad/features/cart/ui/model/cart_model.dart';

class CartList {
  List<CartModel>? results;
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
      results = <CartModel>[];
      json['results'].forEach((v) {
        results!.add(CartModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}
