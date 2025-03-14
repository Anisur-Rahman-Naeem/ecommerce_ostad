import 'package:ecommerce_ostad/features/product/review/ui/models/review.dart';
import 'package:flutter/material.dart';

class ReviewItemWidget extends StatefulWidget {
  const ReviewItemWidget({
    super.key,
    required this.reviewModel,
  });

  final Review reviewModel;

  @override
  State<ReviewItemWidget> createState() => _ReviewItemWidgetState();
}

class _ReviewItemWidgetState extends State<ReviewItemWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 15,
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.black45,
                      size: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "${widget.reviewModel.user?.firstName ?? "No name"} ${widget.reviewModel.user?.lastName ?? "No name"}",
                    style: textTheme.titleSmall?.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.reviewModel.comment}",
                  style: const TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
