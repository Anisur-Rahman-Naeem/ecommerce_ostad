import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/cart_checkout_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/cart_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/widgets/cart_product_item_widget.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:ecommerce_ostad/user/controller/user_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {

  final AuthController _authController = Get.find<AuthController>();
  final CartListController _cartListController = Get.find<CartListController>();
  final UserModelController _userModelController = Get.find<UserModelController>();
  final CartCheckoutController _cartCheckoutController = Get.find<CartCheckoutController>();
  @override
  void initState() {
    _checkTokenAndFetchWishlist();
    _userModelController.gettingUserInfo();
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
              return GetBuilder<CartCheckoutController>(
                builder: (checkoutController) {
                  if(checkoutController.inProgress) {
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
              onPressed: () async {
                bool result = await _cartCheckoutController.cartCheckout(_userModelController.userInfo!);
                if (result) {
                  _showOrderSuccessDialog(context);
                  _cartListController.getCartList();
                }
              },
              child: const Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }

  void _showOrderSuccessDialog(BuildContext context) {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: const Column(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 60),
                SizedBox(height: 10),
                Text("Order Created!", style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: const Text("Your order has been successfully placed.", textAlign:  TextAlign.center),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("OK", style: TextStyle(color: Colors.green),))
            ],
          );
        });
  }
}

