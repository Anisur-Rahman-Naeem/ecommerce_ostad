import 'package:ecommerce_ostad/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:ecommerce_ostad/features/wishlist/ui/controllers/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  final AuthController _authController = Get.find<AuthController>();
  final WishListController _wishListController = Get.find<WishListController>();
  @override
  void initState() {
    _checkTokenAndFetchWishlist();
    super.initState();
  }

  Future<void> _checkTokenAndFetchWishlist() async {
    bool hastoken = await _authController.isTokenAvailable();
    if (hastoken) {
      bool result = await _wishListController.getWishLists();
      if(result == false) {
        showSnackBarMessage(context, _wishListController.errorMessage!, true);
        Navigator.pushNamed(context, SignInScreen.name);
      }
    } else {
      showSnackBarMessage(context, "Token not found!", true);
      Navigator.pushNamed(context, SignInScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        _checkTokenAndFetchWishlist();
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) {
          _onPop();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Wishlist"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: _onPop,
            ),
          ),
          body: GetBuilder<WishListController>(builder: (controller) {
            if(controller.inProgress){
              return const CenteredCircularProgressIndicator();
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 4,
                mainAxisSpacing: 3,
              ),
              itemCount: controller.wishListProductDetails.length,
              itemBuilder: (context, index) {
                var product = controller.wishListProductDetails[index];
                return FittedBox(
                    child: ProductItemWIdget(
                  productModel: product,
                ));
              },
            );
          }),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
