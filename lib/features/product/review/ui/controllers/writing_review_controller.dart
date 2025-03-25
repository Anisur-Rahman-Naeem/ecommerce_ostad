import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class WritingReviewController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  var rating = 0.0.obs;

  void updateRating(double newRating) {
    rating.value = newRating;
  }

  Future<bool> writeReview(String productId, var rating, String comment) async {
    bool isSuccess = false;
    _inProgress= true;
    update();
    Map<String, dynamic> requestBody = {
      'product' : productId,
      'rating' : rating,
      'comment' : comment
    };
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.writingReviewUrl, body: requestBody);
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}