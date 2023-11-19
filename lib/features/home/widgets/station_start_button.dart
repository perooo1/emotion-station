import 'package:flutter/material.dart';

class StationStartButton extends StatelessWidget {
  const StationStartButton({
    required this.fillColor,
    required this.borderColor,
    required this.borderRadius,
    required this.title,
    required this.onAction,
    this.icon,
    this.width = double.infinity,
    super.key,
  });

  final Color fillColor;
  final VoidCallback onAction;
  final Color borderColor;
  final double borderRadius;
  final String title;
  final String? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAction(),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            //Image.asset(icon ?? ''),
          ],
        ),
      ),
    );
  }
}
