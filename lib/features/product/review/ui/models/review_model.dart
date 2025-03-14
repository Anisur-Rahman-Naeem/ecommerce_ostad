import 'package:ecommerce_ostad/features/product/review/ui/models/review.dart';

class ReviewModel {
  int? code;
  String? status;
  String? msg;
  ReviewList? data;

  ReviewModel({this.code, this.status, this.msg, this.data});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ReviewList.fromJson(json['data']) : null;
  }
}

class ReviewList {
  List<Review>? reviews;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  ReviewList(
      {this.reviews,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  ReviewList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      reviews = <Review>[];
      json['results'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}