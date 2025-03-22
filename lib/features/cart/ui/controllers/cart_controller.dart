
import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/cart/ui/model/cart_list_model.dart';
import 'package:ecommerce_ostad/features/cart/ui/model/cart_model.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_data_receiver_model.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_ostad/features/product/review/ui/models/review.dart';
import 'package:ecommerce_ostad/features/product/ui/controllers/product_details_controller.dart';
import 'package:ecommerce_ostad/features/wishlist/ui/models/wishlist_model.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  final ProductDetailsController _productDetailsController =
      ProductDetailsController();

  // List<ProductDetailsDataReceiverModel?> _cartListProducts = [];
  //
  // List<ProductDetailsModel> get cartListProducts {
  //   return _cartListProducts
  //       .map((receiver) => receiver?.data!)
  //       .where((details) => details != null)
  //       .cast<ProductDetailsModel>()
  //       .toList();
  // }

  final List<CartItem?> _cartItemProducts = [];

  RxDouble total = 0.0.obs;

  List<CartItem?> get cartItemList => _cartItemProducts;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  AuthController authController = AuthController();
  bool verifyToken = false;

  Future<bool> checkToken() async {
    verifyToken = await authController.isTokenAvailable();
    return verifyToken;
  }

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();



    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.cartListsUrl);
    if (response.isSuccess) {
      CartModel cartModel =
          CartModel.fromJson(response.responseData);
      // List<String> productIds = cartModel.data?.results
      //         ?.map((item) {
      //           return item.product?.sId ?? "";
      //         })
      //         .where((id) => id.isNotEmpty)
      //         .toList() ??
      //     [];

      // _cartListProducts = await Future.wait(productIds.map((productId) async {
      //   ProductDetailsDataReceiverModel? product = await _productDetailsController.fetchingProductDetails(productId);
      //   if(product == null) {
      //     print("Skipping productId: $productId, data not found");
      //   }
      //   return product;
      // }));
      if (cartModel.data?.results != null) {
        //clearing previous items and gettng new one
        _cartItemProducts.clear();
        _cartItemProducts.addAll(cartModel.data!.results!);
      }

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  String getTotalCartPrice() {
    total.value = _cartItemProducts.fold(0.0, (sum, item) => sum + (item?.product?.currentPrice ?? 0.0));
    return total.toStringAsFixed(2);
  }
}
