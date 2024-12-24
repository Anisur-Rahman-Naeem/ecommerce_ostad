import 'package:ecommerce_ostad/features/home/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const name = "/category-list-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category list"),
      ),
      body: GridView.builder(
        itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 4,mainAxisSpacing: 16), itemBuilder: (context, index){
            return const FittedBox(child: CategoryitemWIdget());
      }),
    );
  }
}
