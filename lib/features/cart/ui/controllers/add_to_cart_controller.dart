import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  Future<bool> addingToCart(String productid) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> requestBody = {
      'product' : productid
    };
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.cartListsUrl, body: requestBody);
    if (response.isSuccess) {
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}