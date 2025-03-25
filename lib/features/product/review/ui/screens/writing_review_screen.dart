import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:ecommerce_ostad/features/product/review/ui/controllers/writing_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WritingReviewScreen extends StatefulWidget {
  const WritingReviewScreen({super.key, required this.productId});

  final String productId;
  static const String name = "product/writing_review";

  @override
  State<WritingReviewScreen> createState() => _WritingReviewScreenState();
}

class _WritingReviewScreenState extends State<WritingReviewScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _commentTEController = TextEditingController();
  final WritingReviewController _writingReviewController =
      Get.find<WritingReviewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 54,
                ),
                const SizedBox(
                  height: 14,
                ),
                RatingBar.builder(
                  initialRating: _writingReviewController.rating.value,
                  minRating: 1,
                  itemSize: 50,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    _writingReviewController.updateRating(rating);
                  },

                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: _writingReviewController,
                  // maxLines: 10,
                  // decoration: const InputDecoration(
                  //   hintText: 'Write Review',
                  // ),
                  // validator: (String? value) {
                  //   if (value?.trim().isEmpty ?? true) {
                  //     return 'Enter valid last name';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _commentTEController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Write your comment',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter the comment';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<WritingReviewController>(builder: (controller) {
                  return ElevatedButton(
                    onPressed: _onTapSubmitButton,
                    child: Visibility(
                      visible: !controller.inProgress,
                      replacement: const CenteredCircularProgressIndicator(color: Colors.white,),
                      child: const Text("Submit"),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formkey.currentState!.validate()) {
      _writeReview();
    }
  }

  Future<void> _writeReview() async {
    final bool result = await Get.find<WritingReviewController>().writeReview(
        widget.productId,
        _writingReviewController.rating.value,
        _commentTEController.text);
    if (result) {
      showSnackBarMessage(context, 'Review Created');
      Navigator.pop(context);
    }
  }
}
