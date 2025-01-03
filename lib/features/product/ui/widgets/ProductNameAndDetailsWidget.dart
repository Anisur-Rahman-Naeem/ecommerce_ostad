import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';

class productNameAndDetailsWidget extends StatelessWidget {
  const productNameAndDetailsWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'Nike Shoe A2ERF - New year special deal',
            style: textTheme.titleMedium,
          ),
          Row(
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Reviews"),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.themeColor,
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 14,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}