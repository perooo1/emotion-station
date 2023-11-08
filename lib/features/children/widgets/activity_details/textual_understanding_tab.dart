import 'package:emotion_station/features/children/bloc/completed_activity_cubit.dart';
import 'package:emotion_station/features/children/widgets/activity_details/activity_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextualUnderstandingTab extends StatelessWidget {
  const TextualUnderstandingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompletedActivityCubit>();

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
              yAxisName: 'Vrijeme',
              maxY: cubit.state.textualTabDurationData?.maxY ?? 20.0,
              barGroups: cubit.state.textualTabDurationData?.dataGroups,
            ),
            const SizedBox(height: 12.0),
            ESBarChart(
              isObservationCategoryChart: true,
              maxY: cubit.state.textualTabComprehensionData?.maxY ?? 20.0,
              barGroups: cubit.state.textualTabComprehensionData?.dataGroups,
            ),
          ],
        ),
      ),
    );
  }
}
