import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_data_receiver_model.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductDetailsDataReceiverModel? _productDetailsDataReceiverModel;

  ProductDetailsModel? get productDetailsModel => _productDetailsDataReceiverModel!.data!;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.productDetailsUrl(productId));
    if (response.isSuccess) {
       _productDetailsDataReceiverModel = ProductDetailsDataReceiverModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
