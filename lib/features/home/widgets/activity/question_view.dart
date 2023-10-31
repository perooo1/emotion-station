import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/bloc/activity_cubit.dart';
import 'package:emotion_station/features/home/widgets/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityCubit>();

    return Container(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 88),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (question.imageAssetPath != null)
            Image.asset(
              question.imageAssetPath!,
              fit: BoxFit.fill,
            ),
          if (question.storyText != null)
            Expanded(
              child: Text(question.storyText!),
            ),
          const SizedBox(height: 16),
          Expanded(child: Text(question.text)),
          const SizedBox(height: 16),
          //OptionButton(option: question.options[0]),
          QuestionAnswers(
            onOptionSelected: (comprehensionLevel) => cubit.setAnswer(comprehensionLevel),
            options: question.options,
          ),

/* 
          ...List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.all(8.0),
              child: OptionButton(
                option: question.options[index],
                onOptionSelected: (comprehensionLevel) => cubit.setAnswer(comprehensionLevel),

              ),
            ),
          ),
*/
/*
          ...List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChoiceChip(
                label: Container(
                  width: double.infinity,
                  height: 56.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(question.options[index].text),
                  ),
                ),
                //selected: cubit.state.reckoginitionAnswer1 != null ? true : false,
                selected: cubit
                        .state.emotionStation.questions[index].options[index].comprehensionLevel ==
                    cubit.state
                        .reckoginitionAnswer1, // cubit.state.reckoginitionAnswer1 != null ? true : false,
                onSelected: (value) =>
                    value ? cubit.setAnswer(question.options[index].comprehensionLevel) : null,
              ),
            );
          }).toList(),
*/

/*
          ChoiceChip(
            label: Container(
              width: double.infinity,
              height: 56.0,
              child: Align(
                alignment: Alignment.center,
                child: Text(question.options[0].text),
              ),
            ),
            selected: cubit.state.reckoginitionAnswer1 != null ? true : false,
            onSelected: (value) =>
                value ? cubit.setAnswer(question.options[0].comprehensionLevel) : null,
          ),
          const SizedBox(height: 16),
          ChoiceChip(
            label: Container(
              width: double.infinity,
              height: 56.0,
              child: Align(
                alignment: Alignment.center,
                child: Text(question.options[1].text),
              ),
            ),
            selected: cubit.state.reckoginitionAnswer1 != null ? true : false,
            onSelected: (value) =>
                value ? cubit.setAnswer(question.options[1].comprehensionLevel) : null,
          ),
          const SizedBox(height: 16),
          ChoiceChip(
            label: Container(
              width: double.infinity,
              height: 56.0,
              child: Align(
                alignment: Alignment.center,
                child: Text(question.options[2].text),
              ),
            ),
            selected: cubit.state.reckoginitionAnswer1 != null ? true : false,
            onSelected: (value) =>
                value ? cubit.setAnswer(question.options[2].comprehensionLevel) : null,
          ),
*/
        ],
      ),
    );
  }
}
