import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarousalSlider extends StatefulWidget {
  const HomeCarousalSlider({
    super.key,
  });

  @override
  State<HomeCarousalSlider> createState() => _HomeCarousalSliderState();
}

class _HomeCarousalSliderState extends State<HomeCarousalSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
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
        SizedBox(height: 2,),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, _){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color:value == i ? AppColors.themeColor : Colors.transparent,
                        border: Border.all(color: Colors.grey.shade300)
                      ),
                    )
                ],
              );
            }),
      ],
    );
  }
}

