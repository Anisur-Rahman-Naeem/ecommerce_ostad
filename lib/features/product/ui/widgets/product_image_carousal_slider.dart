import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousalSlider extends StatefulWidget {
  const ProductImageCarousalSlider({
    super.key,
  });

  @override
  State<ProductImageCarousalSlider> createState() =>
      _ProductImageCarousalSliderState();
}

class _ProductImageCarousalSliderState
    extends State<ProductImageCarousalSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        // SizedBox(height: 2,),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        width: 16,
                        height: 16,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: value == i
                                ? AppColors.themeColor
                                : Colors.white,
                            border: Border.all(color: Colors.grey.shade300)),
                      )
                  ],
                );
              }),
        ),
      ],
    );
  }
}
