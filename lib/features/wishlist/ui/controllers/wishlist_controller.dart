import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_data_receiver_model.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_ostad/features/product/review/ui/models/review.dart';
import 'package:ecommerce_ostad/features/product/ui/controllers/product_details_controller.dart';
import 'package:ecommerce_ostad/features/wishlist/ui/models/wishlist_model.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inProgress = false;

  final ProductDetailsController _productDetailsController =
      ProductDetailsController();

  List<ProductDetailsDataReceiverModel?> _wishListProducts = [];

  List<ProductDetailsModel> get wishListProductDetails {
    return _wishListProducts
        .map((receiver) => receiver?.data!)
        .where((details) => details != null)
        .cast<ProductDetailsModel>()
        .toList();
  }

  bool get inProgress => _inProgress;

  final List<Review> _reviewList = [];

  List<Review> get reviews => _reviewList;

  String? _errorMessage;

  AuthController authController = AuthController();

  String? get errorMessage => _errorMessage;

  Future<bool> getWishLists() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.wishListsUrl);
    if (response.isSuccess) {
      WishListModel wishListModel =
          WishListModel.fromJson(response.responseData);
      List<String> productIds = wishListModel.data?.results
              ?.map((item) {
                return item.product?.sId ?? "";
              })
              .where((id) => id.isNotEmpty)
              .toList() ??
          [];

      _wishListProducts = await Future.wait(productIds.map((productId) async {
        await _productDetailsController.getProductDetails(productId);
      }));

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
