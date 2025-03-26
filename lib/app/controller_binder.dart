import 'package:ecommerce_ostad/features/auth/ui/controllers/sign_In_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/add_to_cart_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/cart_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/delete_item_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/category_list_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/product_list_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/product_list_by_category_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/slider_list_controller.dart';
import 'package:ecommerce_ostad/features/product/review/ui/controllers/review_model_controller.dart';
import 'package:ecommerce_ostad/features/product/review/ui/controllers/writing_review_controller.dart';
import 'package:ecommerce_ostad/features/product/ui/controllers/product_details_controller.dart';
import 'package:ecommerce_ostad/features/wishlist/ui/controllers/wishlist_controller.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(SignInController());
    Get.put(OTPVerficationController());
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
    Get.put(SignUpController());
    Get.put(SliderListController());
    Get.put(ProductListByCategoryController());
    Get.put(ReviewModelController());
    Get.put(WishListController());
    Get.put(CartListController());
    Get.put(WritingReviewController());
    Get.put(AddToCartController());
    Get.put(DeleteItemController());
  }

}