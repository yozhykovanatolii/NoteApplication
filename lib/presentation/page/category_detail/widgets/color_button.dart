import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final bool isSelected;
  final GestureTapCallback onTap;
  final int colorHex;

  const ColorButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.colorHex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              isSelected
                  ? Border.all(
                    color: Colors.black,
                    width: 2.5,
                  )
                  : null,
        ),
        child: Icon(
          Icons.circle,
          size: 35,
          color: Color(colorHex),
        ),
      ),
    );
  }
}
