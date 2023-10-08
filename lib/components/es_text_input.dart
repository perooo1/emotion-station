import 'package:flutter/material.dart';

class ESTextInput extends StatelessWidget {
  const ESTextInput({
    super.key,
    required this.borderRadius,
    this.filled = false,
    required this.height,
    required this.labelText,
    required this.onChanged,
  });

  final double borderRadius;
  final bool filled;
  final double height;
  final String labelText;
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
        onChanged: (value) => onChanged(value),
        //onChanged: (value) => cubit.saveEmailToState(value),
      ),
    );
  }
}
