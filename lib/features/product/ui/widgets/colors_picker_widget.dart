import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColorsPickerWidget extends StatefulWidget {
  const ColorsPickerWidget({super.key, required this.colors, required this.onColorSelected});

  final List<String> colors;
  final Function(String) onColorSelected;

  @override
  State<ColorsPickerWidget> createState() => _ColorsPickerWidgetState();
}

class _ColorsPickerWidgetState extends State<ColorsPickerWidget> {
  String? _isSelectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getColorItems(),
      ),
    );
  }

  List<Widget> getColorItems() {
    List<Widget> colorItemList = [];
    for (String color in widget.colors) {
        Widget item = getColorItemWidget(
            name: color,
            onTap: () {
              _isSelectedColor = color;
              widget.onColorSelected(_isSelectedColor!);
              setState(() {});
        },
            isSelected: _isSelectedColor == color,
    );
      colorItemList.add(item);
    }
    return colorItemList;
  }

  Widget getColorItemWidget(
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
        child: Text(name, style: TextStyle(
          color: isSelected ? Colors.white : null,
        ),),
      ),
    );
  }
}
