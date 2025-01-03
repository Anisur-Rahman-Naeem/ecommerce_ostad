import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
  });

  final List<String> sizes;
  final Function(String) onSizeSelected;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _isSelectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getSizeItems(),
      ),
    );
  }

  List<Widget> getSizeItems() {
    List<Widget> sizeItemList = [];
    for (String size in widget.sizes) {
      Widget item = getSizeItemWidget(
        name: size,
        onTap: () {
          _isSelectedSize = size;
          widget.onSizeSelected(_isSelectedSize!);
          setState(() {});
        },
        isSelected: _isSelectedSize == size,
      );
      sizeItemList.add(item);
    }
    return sizeItemList;
  }

  Widget getSizeItemWidget(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
