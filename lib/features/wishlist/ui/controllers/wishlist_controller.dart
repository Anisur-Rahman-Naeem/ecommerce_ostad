import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/product/review/ui/models/review.dart';
import 'package:ecommerce_ostad/features/product/review/ui/models/review_model.dart';
import 'package:ecommerce_ostad/features/wishlist/ui/models/wishlist_model.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  final List<Review> _reviewList = [];

  List<Review> get reviews => _reviewList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getWishLists() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.wishListsUrl);
    if (response.isSuccess) {
      WishListModel wishListModel = WishListModel.fromJson(response.responseData);
      List<String> productIds = wishListModel.data?.results?.map((item) {
        return item.product?.sId ?? "";
      }).where((id) => id.isNotEmpty).toList() ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
