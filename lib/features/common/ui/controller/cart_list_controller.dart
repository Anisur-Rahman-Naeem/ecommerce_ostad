import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/cart/ui/model/cart_list_model.dart';
import 'package:ecommerce_ostad/features/cart/ui/model/cart_model.dart';
import 'package:ecommerce_ostad/features/common/data/models/category/category_pagination_model.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  final List<CartModel> _cartList = [];

  List<CartModel> get cartList => _cartList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.cartUrl);
    if (response.isSuccess) {
      CartList cartList= CartList.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
