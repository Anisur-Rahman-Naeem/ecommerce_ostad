import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/features/home/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class HomeCarousalSlider extends StatefulWidget {
  const HomeCarousalSlider({
    super.key,
    required this.sliderList,
  });

  final List<SliderModel>? sliderList;

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
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },
          ),
          items: widget.sliderList?.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(banner.photoUrl ?? ''),
                        fit: BoxFit.cover
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.description ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              width: 90,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Buy now')))
                        ],
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 2,
        ),
        ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.sliderList!.length; i++)
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: value == i
                              ? AppColors.themeColor
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade300)),
                    )
                ],
              );
            }),
      ],
    );
  }
}
