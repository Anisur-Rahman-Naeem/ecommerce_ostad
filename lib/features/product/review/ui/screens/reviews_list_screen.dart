import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/product/review/ui/controllers/review_model_controller.dart';
import 'package:ecommerce_ostad/features/product/review/ui/screens/writing_review_screen.dart';
import 'package:ecommerce_ostad/features/product/review/ui/widgets/review_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({super.key, required this.productId});

  final String productId;

  static const String name = '/product/review_list';

  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  final ReviewModelController _reviewModelController =
      Get.find<ReviewModelController>();

  @override
  void initState() {
    _reviewModelController.getReviews(widget.productId);
    super.initState();
  }

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
      body: GetBuilder<ReviewModelController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenteredCircularProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.reviews.length,
                itemBuilder: (context, index) {
                  return ReviewItemWidget(
                    reviewModel: controller.reviews[index],
                  );
                },
              ),
            ),
            reviewsBuilder(textTheme),
          ],
        );
      }),
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
                '(${_reviewModelController.reviews.length})',
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
