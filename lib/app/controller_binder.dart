import 'package:ecommerce_ostad/features/auth/ui/controllers/sign_In_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/cart_list_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/category_list_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/product_list_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/product_list_by_category_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/slider_list_controller.dart';
import 'package:ecommerce_ostad/features/product/ui/controllers/product_details_controller.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(SignInController());
    Get.put(OTPVerficationController());
    Get.put(AuthController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
    Get.put(SignUpController());
    Get.put(SliderListController());
    Get.put(CartListController());
    Get.put(ProductListByCategoryController());
  }

}