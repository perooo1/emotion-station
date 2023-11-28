import 'package:flutter/material.dart';

class ESTextInput extends StatelessWidget {
  const ESTextInput({
    super.key,
    required this.borderRadius,
    this.filled = false,
    required this.height,
    required this.labelText,
    this.obscureText = false,
    required this.onChanged,
  });

  final double borderRadius;
  final bool filled;
  final double height;
  final String labelText;
  final bool obscureText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          filled: filled,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        obscureText: obscureText,
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
