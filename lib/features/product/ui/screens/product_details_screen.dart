import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/ProductNameAndDetailsWidget.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/colors_picker_widget.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/product_image_carousal_slider.dart';
import 'package:ecommerce_ostad/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios),),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousalSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            productNameAndDetailsWidget(textTheme: textTheme),
                            ProductQuantityIncDecButton(
                              onChange: (int) {},
                            ),
                          ],
                        ),
                        ColorChoosePortion(textTheme),
                        sizeChoosePortion(textTheme),
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
                        Text('''But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.''', style: TextStyle(
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
          _buildPriceAndAddToCartSection(textTheme)
        ],
      ),
    );
  }

  Widget sizeChoosePortion(TextTheme textTheme) {
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
          sizes: const ['S', 'M', 'L', 'XL', 'XXL'],
          onSizeSelected: (String selectedSize) {},
        ),
      ],
    );
  }

  Widget ColorChoosePortion(TextTheme textTheme) {
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
          colors: const ['Red', 'Green', 'Yellow', 'Pink'],
          onColorSelected: (String selectedColor) {},
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: textTheme.titleSmall,
              ),
              Text(
                '\$100',
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
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
