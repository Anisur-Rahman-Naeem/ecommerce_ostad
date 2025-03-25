import 'package:ecommerce_ostad/features/auth/data/models/sign_in_model.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';

class Review {
  String? sId;
  ProductDetailsModel? product;
  User? user;
  double? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Review(
      {this.sId,
        this.product,
        this.user,
        this.rating,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Review.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'] != null ? ProductDetailsModel.fromJson(json['product']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rating = json['rating']?.toDouble();
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
