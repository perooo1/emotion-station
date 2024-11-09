import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/widgets/activity_details/activity_details.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmotionRecognitionTab extends StatelessWidget {
  const EmotionRecognitionTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedActivityCubit>();
    final l10n = AppLocalizations.of(context);

    final answer1 =
        cubit.state.activityRecord.emotionStation.questions[0].options
            .where(
              (element) =>
                  element.comprehensionLevel ==
                  cubit.state.activityRecord.recognitionAnswer1,
            )
            .toList();
    final answer2 =
        cubit.state.activityRecord.emotionStation.questions[1].options
            .where(
              (element) =>
                  element.comprehensionLevel ==
                  cubit.state.activityRecord.recognitionAnswer2,
            )
            .toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
          bottom: 75.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.timeChartString.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text('${l10n.totalDurationString}:'),
                      Text(
                        '${(cubit.state.activityRecord.recognitionAnswer1Duration + cubit.state.activityRecord.recognitionAnswer2Duration).inSeconds} s',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ESBarChart(
              yAxisName: l10n.leftAxisTitleTimeBarChart,
              isObservationCategoryChart: true,
              isShowingDurationData: true,
              maxY: cubit.state.recognitionTabDurationData?.maxY ?? 20.0,
              barGroups: cubit.state.recognitionTabDurationData?.dataGroups,
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.comprehensionLevelChartString.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            ESBarChart(
              isObservationCategoryChart: true,
              maxY: cubit.state.recognitionTabComprehensionData?.maxY ?? 20.0,
              barGroups:
                  cubit.state.recognitionTabComprehensionData?.dataGroups,
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
                      cubit.state.activityRecord.emotionStation.questions[0]
                          .text,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16.0),
                    Image.asset(
                      cubit.state.activityRecord.emotionStation.questions[0]
                          .imageAssetPath!,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 16.0),
                    Text('${l10n.childAnsweredString}:'),
                    const SizedBox(height: 16.0),
                    Text(
                      answer1[0].text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
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
                      cubit.state.activityRecord.emotionStation.questions[1]
                          .text,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16.0),
                    Image.asset(
                      cubit.state.activityRecord.emotionStation.questions[1]
                          .imageAssetPath!,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 16.0),
                    Text('${l10n.childAnsweredString}:'),
                    const SizedBox(height: 16.0),
                    Text(
                      answer2[0].text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
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
