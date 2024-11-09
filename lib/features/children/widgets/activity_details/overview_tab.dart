import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedActivityCubit>();
    final l10n = AppLocalizations.of(context);

    final totalActivityTime =
        cubit.state.activityRecord.recognitionAnswer1Duration +
            cubit.state.activityRecord.recognitionAnswer2Duration +
            cubit.state.activityRecord.understandingTextualAnswer1Duration +
            cubit.state.activityRecord.understandingTextualAnswer2Duration +
            cubit.state.activityRecord.understandingVisualAnswer1Duration +
            cubit.state.activityRecord.understandingVisualAnswer2Duration;

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
              maxY: cubit.state.homeTabBarChartData?.maxY ?? 20.0,
              barGroups: cubit.state.homeTabBarChartData?.dataGroups,
            ),
            const SizedBox(height: 12.0),
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
                  Text('${l10n.totalDurationString}:'),
                  Text(
                    getDurationInMinutes(totalActivityTime),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            ESLineChart(
              axisBorderValues:
                  cubit.state.homeTabLineChartData?.maxAxisValues ?? [],
              spots: cubit.state.homeTabLineChartData?.spots ?? [],
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.radarChartString.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            ESRadarChart(
              rawDataSets: cubit.state.homeTabRadarChartData?.rawData ?? [],
              dataSets: cubit.state.homeTabRadarChartData?.radarDataset ?? [],
            ),
          ],
        ),
      ),
    );
  }

  String getDurationInMinutes(Duration duration) {
    final int minutes = duration.inMinutes;
    final int seconds = duration.inSeconds % 60;
    return '$minutes min : ${seconds.toString().padLeft(2, '0')} sec';
  }
}
