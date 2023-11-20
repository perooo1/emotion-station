import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/bloc/activity_cubit.dart';
import 'package:emotion_station/features/home/widgets/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key, required this.question, required this.index});

  final Question question;
  final int index;

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
              width: 250,
              height: 250,
              fit: BoxFit.fill,
            ),
          if (question.storyText != null)
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Text(question.storyText!),
                ),
              ),
            ),
          /*
            Expanded(
              child: Text(question.storyText!),
            ),
            */
          const SizedBox(height: 16),
          Expanded(child: Text(question.text)),
          const SizedBox(height: 16),
          QuestionAnswers(
            onOptionSelected: (comprehensionLevel) => cubit.setAnswer(comprehensionLevel, index),
            options: question.options,
          ),
        ],
      ),
    );
  }
}
