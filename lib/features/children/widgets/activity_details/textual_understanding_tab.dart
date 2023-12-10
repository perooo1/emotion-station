import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/widgets/activity_details/activity_details.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextualUnderstandingTab extends StatelessWidget {
  const TextualUnderstandingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedActivityCubit>();

    final l10n = AppLocalizations.of(context);

    final answer1 = cubit.state.activityRecord.emotionStation.questions[2].options
        .where(
          (element) =>
              element.comprehensionLevel == cubit.state.activityRecord.understandingTextualAnswer1,
        )
        .toList();
    final answer2 = cubit.state.activityRecord.emotionStation.questions[3].options
        .where(
          (element) =>
              element.comprehensionLevel == cubit.state.activityRecord.understandingTextualAnswer2,
        )
        .toList();

    return SingleChildScrollView(
      child: Padding(
        //padding: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
          bottom: 75.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12.0),
            ESBarChart(
              isShowingDurationData: true,
              isObservationCategoryChart: true,
              yAxisName: l10n.leftAxisTitleTimeBarChart,
              maxY: cubit.state.textualTabDurationData?.maxY ?? 20.0,
              barGroups: cubit.state.textualTabDurationData?.dataGroups,
            ),
            const SizedBox(height: 12.0),
            ESBarChart(
              isObservationCategoryChart: true,
              maxY: cubit.state.textualTabComprehensionData?.maxY ?? 20.0,
              barGroups: cubit.state.textualTabComprehensionData?.dataGroups,
            ),
            const SizedBox(height: 12.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cubit.state.activityRecord.emotionStation.questions[2].storyText!,
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(),
                    Text('${l10n.childAnsweredString}:'),
                    const SizedBox(height: 16.0),
                    Text(
                      answer1[0].text,
                      //cubit.state.activityRecord.recognitionAnswer1.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cubit.state.activityRecord.emotionStation.questions[3].storyText!,
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(),
                    Text(
                      '${l10n.childAnsweredString}:',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      answer2[0].text,
                      //cubit.state.activityRecord.recognitionAnswer1.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
