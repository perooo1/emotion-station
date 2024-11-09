import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/bloc/activity_cubit.dart';
import 'package:emotion_station/features/home/widgets/activity/activity.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({
    required this.activityTypeName,
    required this.childId,
    super.key,
  });

  final String activityTypeName;
  final String childId;

  @override
  Widget build(BuildContext context) {
    final emotionStation = getAppropriateStation(activityTypeName, context);

    return BlocProvider<ActivityCubit>(
      create: (_) => GetIt.I.get<ActivityCubit>(param1: emotionStation),
      child:
          _ActivityView(activityTypeName: activityTypeName, childId: childId),
    );
  }

  EmotionStation getAppropriateStation(
      String activityTypeName, BuildContext context) {
    final currentLocalization = Localizations.localeOf(context);
    //first check the language and then emotion station types

    if (currentLocalization.languageCode == 'hr') {
      if (activityTypeName == ActivityType.stationOfHappiness.name) {
        return EmotionStation(
          activityType: ActivityType.stationOfHappiness,
          stationName: ActivityType.stationOfHappiness.name,
          questions: QuestionsCroatian().questionsHappiness,
        );
      } else if (activityTypeName == ActivityType.stationOfSadness.name) {
        return EmotionStation(
          activityType: ActivityType.stationOfSadness,
          stationName: ActivityType.stationOfSadness.name,
          questions: QuestionsCroatian().questionsSadness,
        );
      } else if (activityTypeName == ActivityType.stationOfAnger.name) {
        return EmotionStation(
          activityType: ActivityType.stationOfAnger,
          stationName: ActivityType.stationOfAnger.name,
          questions: QuestionsCroatian().questionsAnger,
        );
      } else {
        return EmotionStation(
          activityType: ActivityType.stationOfFear,
          stationName: ActivityType.stationOfFear.name,
          questions: QuestionsCroatian().questionsFear,
        );
      }
    } else {
      if (activityTypeName == ActivityType.stationOfHappiness.name) {
        return EmotionStation(
          activityType: ActivityType.stationOfHappiness,
          stationName: ActivityType.stationOfHappiness.name,
          questions: QuestionsEnglish().questionsHappiness,
        );
      } else {
        return EmotionStation(
          activityType: ActivityType.stationOfSadness,
          stationName: ActivityType.stationOfSadness.name,
          questions: QuestionsEnglish().questionsSadness,
        );
      }
    }
  }
}

class _ActivityView extends StatelessWidget {
  const _ActivityView({required this.activityTypeName, required this.childId});

  final String activityTypeName;
  final String childId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityCubit>();
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<ActivityCubit, ActivityState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false),
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: cubit.controller,
            itemCount: state.emotionStation.questions.length,
            itemBuilder: (context, index) {
              final question = state.emotionStation.questions[index];
              cubit.currentPageIndex = index;
              return QuestionView(question: question, index: index);
            },
          ),
          bottomSheet: Container(
            height: 80,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(l10n.exitActivityDialogTitle),
                        content: Text(l10n.exitActivityDialogContent),
                        actions: [
                          TextButton(
                              onPressed: () => context.pop(),
                              child: Text(l10n.cancelString)),
                          TextButton(
                            onPressed: () {
                              context.pop(); // pop dialog
                              context.pop(); // pop activity
                            },
                            child: Text(l10n.exitString),
                          ),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          Text(
                            l10n.exitString,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: cubit.controller,
                  count: state.emotionStation.questions.length,
                  effect: WormEffect(
                    dotColor: Theme.of(context).colorScheme.onPrimary,
                    activeDotColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      if (cubit.isOptionSelected()) {
                        cubit.manageStopwatch();

                        if (cubit.currentPageIndex + 1 ==
                            state.emotionStation.questions.length) {
                          cubit.recordActivity(childId: childId);
                          showDialog(
                            context: context,
                            builder: (context) => const Dialog.fullscreen(
                                child: ActivityFinishedDialog()),
                          );
                        } else {
                          cubit.controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(
                                l10n.snackbarMessageSelectOption,
                              ),
                            ),
                          );
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_right,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        Text(
                          l10n.activityScreenNextStation,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
