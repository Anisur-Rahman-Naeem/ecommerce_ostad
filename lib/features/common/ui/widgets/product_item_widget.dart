import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_ostad/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWIdget extends StatelessWidget {
  const ProductItemWIdget({
    super.key, required this.productModel,
  });

  final ProductDetailsModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.12),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Image.asset(
                 'assets/images/nike_shoes.png',
                  width: 140,
                  height: 90,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      productModel.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${productModel.currentPrice ?? ''}", style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeColor,
                        ),),
                        const Wrap(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20,),
                            Text(
                              '4.5', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeColor,
                            ),)
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.themeColor,
                          ),
                          child: const Icon(Icons.favorite_border, size: 14, color: Colors.white,),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
