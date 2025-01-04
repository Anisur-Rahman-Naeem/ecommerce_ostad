import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/product/review/ui/screens/writing_review_screen.dart';
import 'package:ecommerce_ostad/features/product/review/ui/widgets/review_item_widget.dart';
import 'package:flutter/material.dart';

class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({super.key, required this.productId});

  final int productId;

  static const String name = '/product/review_list';

  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text("Reviews"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ReviewItemWidget();
              },
            ),
          ),
          reviewsBuilder(textTheme),
        ],
      ),
    );
  }

  Widget reviewsBuilder(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Reviews',
                style: textTheme.titleSmall?.copyWith(fontSize: 17),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '(1000)',
                style: textTheme.titleSmall?.copyWith(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            width: 70,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, WritingReviewScreen.name);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
