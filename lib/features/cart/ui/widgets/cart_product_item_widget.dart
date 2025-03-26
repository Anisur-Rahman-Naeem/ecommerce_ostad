import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/app/assets_path.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/cart_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/controllers/delete_item_controller.dart';
import 'package:ecommerce_ostad/features/cart/ui/model/cart_list_model.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductItemWidget extends StatefulWidget {
  const CartProductItemWidget({
    super.key, required this.cartItem,
  });
  final CartItem? cartItem;

  @override
  State<CartProductItemWidget> createState() => _CartProductItemWidgetState();
}

class _CartProductItemWidgetState extends State<CartProductItemWidget> {
  final DeleteItemController _deleteItemController = Get.find<DeleteItemController>();
  final CartListController _cartListController = Get.find<CartListController>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartItem?.product?.title ?? "",
                              maxLines: 1,
                              style: textTheme.bodyLarge
                                  ?.copyWith(
                                  overflow:
                                  TextOverflow.ellipsis),
                            ),
                            Row(
                              children: [
                                Text("Color: ${widget.cartItem?.color ?? "N/A"}"),
                                const SizedBox(width: 8),
                                Text("Size: ${widget.cartItem?.size ?? "N/A"}")
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          bool result = await _deleteItemController.deleteItem(widget.cartItem!.sId!);
                          if (result) {
                            showSnackBarMessage(context, 'Successfully deleted!');
                            _cartListController.getCartList();
                          }else{
                            showSnackBarMessage(context, _deleteItemController.errorMessage!);
                          }
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${widget.cartItem?.product?.currentPrice ?? "N/A"}', style: const TextStyle(
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
