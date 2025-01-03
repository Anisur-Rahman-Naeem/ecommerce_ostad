import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/app/assets_path.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartProductItemWidget();
                },
              ),
            ),
            _buildPriceAndCheckoutSection(textTheme)
          ],
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
              const Text(
                '\$100039',
                style: TextStyle(
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

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.dummyImage,
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Nike Shoe - AKNFI54 New year deal',
                              maxLines: 1,
                              style: textTheme.bodyLarge
                                  ?.copyWith(
                                      overflow:
                                          TextOverflow.ellipsis),
                            ),
                            Row(
                              children: [
                                Text("Color: Red"),
                                const SizedBox(width: 8),
                                Text("Size: XL")
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$100', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeColor
                      ),),
                      ProductQuantityIncDecButton(
                        onChange: (int noOfItem) {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
