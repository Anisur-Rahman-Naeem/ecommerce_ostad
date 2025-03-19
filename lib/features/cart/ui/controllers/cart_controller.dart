import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/cart/ui/model/cart_list_model.dart';
import 'package:ecommerce_ostad/features/cart/ui/model/cart_model.dart';
import 'package:ecommerce_ostad/features/product/review/ui/models/review.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  CartModel cartModel = CartModel();

  List<CartItem> get cartListProducts => cartModel.data?.results ?? [];

  bool get inProgress => _inProgress;

  final List<Review> _reviewList = [];

  List<Review> get reviews => _reviewList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.cartListsUrl);
    if (response.isSuccess) {
      cartModel =
          CartModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
