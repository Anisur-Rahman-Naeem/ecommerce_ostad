import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/cart_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/widgets/cart_product_item_widget.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {

  final AuthController _authController = Get.find<AuthController>();
  CartListController _cartListController = Get.find<CartListController>();
  @override
  void initState() {
    _checkTokenAndFetchWishlist();
    super.initState();
  }


  Future<void> _checkTokenAndFetchWishlist() async {
    bool hastoken = await _authController.isTokenAvailable();
    if (hastoken) {
      _cartListController.getCartList();
    } else {
      showSnackBarMessage(context, "Token not found!", true);
      Navigator.pushNamed(context, SignUpScreen.name);
    }
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
            title: const Text("Cart"),
            leading: IconButton(
              onPressed: _onPop,
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: GetBuilder<CartListController>(
            builder: (controller) {
              if(controller.inProgress){
                return const CenteredCircularProgressIndicator();
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartItemList.length,
                      itemBuilder: (context, index) {
                        var cartItem = controller.cartItemList[index];
                        return CartProductItemWidget(cartItem: cartItem,);
                      },
                    ),
                  ),
                  _buildPriceAndCheckoutSection(textTheme)
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }

  Widget _buildPriceAndCheckoutSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Total Price',
                style: textTheme.titleSmall,
              ),
              Text(
                "\$${_cartListController.getTotalCartPrice()}",
                style: const TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }
}

