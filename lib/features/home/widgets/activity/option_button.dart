import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    this.padding = 20.0,
    required this.onOptionSelected,
    required this.option,
    super.key,
    required this.isSelected,
  });

  final double padding;
  final Option option;
  final Function(ComprehensionLevel? comprehensionLevel) onOptionSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onOptionSelected(option.comprehensionLevel);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(padding),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Text(option.text),
        ),
      ),
    );
  }
}
