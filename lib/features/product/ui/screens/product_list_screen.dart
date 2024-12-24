import 'package:ecommerce_ostad/features/home/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  static const String name = "/product/product-list-by-category";

  const ProductListScreen({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 4,
          mainAxisSpacing: 3,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return FittedBox(child: const ProductItemWIdget());
        },
      ),
    );
  }
}
