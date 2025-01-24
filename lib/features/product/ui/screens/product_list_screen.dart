import 'package:ecommerce_ostad/features/common/ui/controller/product_list_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  static const String name = "/product/product-list-by-category";

  const ProductListScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  final String categoryName;
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListController>()
        .getProductListByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetBuilder<ProductListController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenteredCircularProgressIndicator();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 4,
            mainAxisSpacing: 3,
          ),
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            return FittedBox(
              child: ProductItemWIdget(
                productModel: controller.productList[index],
              ),
            );
          },
        );
      }),
    );
  }
}
