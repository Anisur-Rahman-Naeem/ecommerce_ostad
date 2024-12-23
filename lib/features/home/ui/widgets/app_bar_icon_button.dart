import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.icons,
    required this.onTap,
  });

  final IconData icons;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 15,
        child: Icon(
          icons,
          size: 18,
          color: Colors.black45,
        ),
      ),
    );
  }
}
