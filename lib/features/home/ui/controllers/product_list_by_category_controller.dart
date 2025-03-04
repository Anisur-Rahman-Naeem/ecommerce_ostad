import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_list_by_category_data_receiving_model.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ProductListByCategoryController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  final List<ProductDetailsModel> _productDetailsListModel = [];

  List<ProductDetailsModel> get productList => _productDetailsListModel;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductList(String categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.productListByCategoryUrl(categoryId));
    if (response.isSuccess) {
      ProductListbyCategoryDataReceivingModel productListbyCategoryDataReceivingModel = ProductListbyCategoryDataReceivingModel.fromJson(response.responseData);
      _productDetailsListModel.addAll(productListbyCategoryDataReceivingModel.data?.results ?? []);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}