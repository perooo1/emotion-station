import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/bloc/activity_cubit.dart';
import 'package:emotion_station/features/home/widgets/activity/activity.dart';
import 'package:emotion_station/injector/injector.config.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/utils/constants/constants.dart';
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
    final emotionStation = getAppropriateStation(activityTypeName);

    return BlocProvider<ActivityCubit>(
      //create: (_) => Injector.locateService<ActivityCubit>(),
      create: (_) => GetIt.I.get<ActivityCubit>(param1: emotionStation),
      child: _ActivityView(activityTypeName: activityTypeName, childId: childId),
    );
  }

  EmotionStation getAppropriateStation(String activityTypeName) {
    if (activityTypeName == ActivityType.stationOfHappiness.name) {
      return EmotionStation(
        activityType: ActivityType.stationOfHappiness,
        stationName: ActivityType.stationOfHappiness.name,
        questions: QuestionsCroatian().questionsHappiness,
      );
    } else {
      return EmotionStation(
        activityType: ActivityType.stationOfSadness,
        stationName: ActivityType.stationOfSadness.name,
        questions: QuestionsCroatian().questionsSadness,
      );
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

    return BlocBuilder<ActivityCubit, ActivityState>(
      /*
      listenWhen: (previous, current) =>
          previous.reckoginitionAnswer1 != current.reckoginitionAnswer1,
      listener: (context, state) {},
      */
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
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
                TextButton(
                  onPressed: () => cubit.controller.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                  child: Text('exit'),
                ),
                SmoothPageIndicator(
                  controller: cubit.controller,
                  count: state.emotionStation.questions.length,
                  effect: WormEffect(
                      dotColor: Theme.of(context).colorScheme.onPrimary,
                      activeDotColor: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                TextButton(
                  onPressed: () {
                    if (cubit.isOptionSelected()) {
                      cubit.manageStopwatch();

                      if (cubit.currentPageIndex + 1 == state.emotionStation.questions.length) {
                        cubit.recordActivity(childId: childId);
                        showDialog(
                          context: context,
                          builder: (context) => Dialog.fullscreen(child: ActivityFinishedDialog()),
                        );
                      } else {
                        cubit.controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(content: Text('Select an option first')));
                    }
                  },
                  child: Text('next stop'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
/*
  void _onTap(BuildContext context, int index, PageController controller) {
    index == 0
        ? context.pop()
        : controller.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
  }
  */
}

////////////////////////////////////////////////////////
/*
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({
    required this.activityTypeName,
    required this.childId,
    super.key,
  });

  final String activityTypeName;
  final String childId;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  //todo revert to stateless and move to cubit/state

  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            EmotionReckognition(),
            EmotionUnderstandingVisual(),
            EmotionUnderstandingTextual(),
          ],
        ),

/*
            Column(
          children: [
            Text('this is activity screen'),
            Text(' child id is: ${widget.childId}'),
            Text(' activity type is: ${widget.activityTypeName}'),
            EmotionReckognition(),
          ],
        ),
*/
      ),
      bottomSheet: Container(
        height: 80,
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Text('exit'),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: SwapEffect(type: SwapType.yRotation),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Text('next stop'),
            ),
          ],
        ),
      ),

      /*
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => _onTap(context, index),
        indicatorColor: Colors.black.withOpacity(0.0),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.close),
            label: 'Exit station',
          ),
          NavigationDestination(
            icon: Icon(Icons.keyboard_arrow_right),
            selectedIcon: Icon(Icons.info),
            label: 'Next stop',
          ),
        ],
      ),
      */
    );
  }

  void _onTap(BuildContext context, int index) {
    index == 0 ? context.pop() : null;
  }
}
*/
