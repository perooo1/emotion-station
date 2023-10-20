import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmotionReckognition extends StatefulWidget {
  const EmotionReckognition({super.key});

  @override
  State<EmotionReckognition> createState() => _EmotionReckognitionState();
}

class _EmotionReckognitionState extends State<EmotionReckognition> {
  int? _value = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            label: Container(
                width: double.infinity,
                height: 56.0,
                child: Align(alignment: Alignment.center, child: Text('Item $index'))),
            selected: _value == index,
            onSelected: (value) {
              setState(() {
                _value = value ? index : null;
              });
            },
          ),
        );
      }).toList(),
    );

/*
    return Wrap(
      spacing: 5.0,
      direction: Axis.vertical,
      children: List.generate(3, (index) {
        return ChoiceChip(
          label: Text('Item $index'),
          selected: _value == index,
          onSelected: (value) {
            setState(() {
              _value = value ? index : null;
            });
          },
        );
      }).toList(),
    );
*/
  }
}
