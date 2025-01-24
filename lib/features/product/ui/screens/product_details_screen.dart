import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_ostad/features/product/ui/controllers/product_details_controller.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/ProductNameAndDetailsWidget.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/colors_picker_widget.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/product_image_carousal_slider.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios),),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const CenteredCircularProgressIndicator();
          }

          if (controller.errorMessage != null) {
            return Center(
              child: Text(controller.errorMessage!),
            );
          }

          ProductDetails productDetails = controller.productDetails!;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarousalSlider(imageUrls: [productDetails.img1!,productDetails.img2!,productDetails.img3!,productDetails.img4!],),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                productNameAndDetailsWidget(textTheme: textTheme, instance: productDetails),
                                ProductQuantityIncDecButton(
                                  onChange: (int) {},
                                ),
                              ],
                            ),
                            ColorChoosePortion(textTheme, productDetails),
                            sizeChoosePortion(textTheme, productDetails),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Description",
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(productDetails.des ?? '', style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                            ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(textTheme, productDetails.product?.price ?? '0.0')
            ],
          );
        }
      ),
    );
  }

  Widget sizeChoosePortion(TextTheme textTheme, ProductDetails instance) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "Size",
          style: textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        SizePickerWidget(
          sizes: instance.size?.split(',') ?? [],
          onSizeSelected: (String selectedSize) {},
        ),
      ],
    );
  }

  Widget ColorChoosePortion(TextTheme textTheme, ProductDetails instance) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "Color",
          style: textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        ColorsPickerWidget(
          colors: instance.color?.split(',') ?? [],
          onColorSelected: (String selectedColor) {},
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme, String price) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: textTheme.titleSmall,
              ),
              Text(
                '\$$price',
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
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
