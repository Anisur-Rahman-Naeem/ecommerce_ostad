import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/product/review/ui/models/review.dart';
import 'package:ecommerce_ostad/features/product/review/ui/models/review_model.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ReviewModelController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  final List<Review> _reviewList = [];

  List<Review> get reviews => _reviewList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getReviews(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> queryParams = {
      'product' : productId,
    };

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.reviewListUrl, queryParams: queryParams);
    if (response.isSuccess) {
      ReviewModel reviewModel = ReviewModel.fromJson(response.responseData);
      if(reviewModel.data!.reviews != null) {
        _reviewList.clear();
        _reviewList.addAll(reviewModel.data?.reviews ?? []);
        print('THE LENGTH IS : ${reviewModel.data?.reviews?.length}');
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
