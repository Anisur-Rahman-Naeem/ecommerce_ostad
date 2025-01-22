import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/common/data/models/category_model.dart';
import 'package:ecommerce_ostad/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryitemWIdget extends StatelessWidget {
  const CategoryitemWIdget({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name,
            arguments: "Computer");
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              categoryModel.categoryImg ?? '',
              width: 40,
              height: 40,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            categoryModel.categoryName ?? '',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.themeColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
