import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QuestionAnswers extends StatefulWidget {
  const QuestionAnswers({
    required this.onOptionSelected,
    required this.options,
    super.key,
  });

  final Function(ComprehensionLevel? comprehensionLevel) onOptionSelected;
  final List<Option> options;

  @override
  State<QuestionAnswers> createState() => _QuestionAnswersState();
}

class _QuestionAnswersState extends State<QuestionAnswers> {
  bool isFirstOptionSelected = false;
  bool isSecondOptionSelected = false;
  bool isThirdOptionSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          widget.options.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: OptionButton(
              isSelected: checkIfButtonSelected(index),
              option: widget.options[index],
              //onOptionSelected: (comprehensionLevel) => cubit.setAnswer(comprehensionLevel),
              onOptionSelected: (comprehensionLevel) {
                selectSingleButton(index);
                widget.onOptionSelected(comprehensionLevel);
              },
              //isselected = isselected;
              //potencijalno samo kao referenca?
            ),
          ),
        ),
      ],
    );
  }

  bool checkIfButtonSelected(int index) {
    switch (index) {
      case 0:
        return isFirstOptionSelected;
      case 1:
        return isSecondOptionSelected;
      default:
        return isThirdOptionSelected;
    }
  }

  void selectSingleButton(int index) {
    switch (index) {
      case 0:
        setState(() {
          isFirstOptionSelected = true;
          isSecondOptionSelected = false;
          isThirdOptionSelected = false;
        });
        break;
      case 1:
        setState(() {
          isFirstOptionSelected = false;
          isSecondOptionSelected = true;
          isThirdOptionSelected = false;
        });
        break;
      default:
        setState(() {
          isFirstOptionSelected = false;
          isSecondOptionSelected = false;
          isThirdOptionSelected = true;
        });
        break;
    }
  }
}
