import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerce_ostad/features/wishlist/ui/controllers/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    Get.find<WishListController>().getWishLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
