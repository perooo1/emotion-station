import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/child_details_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class ChildDetailsScreen extends StatelessWidget {
  const ChildDetailsScreen({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildDetailsCubit>(
      create: (_) => GetIt.I.get<ChildDetailsCubit>(param1: child),
      child: const _ChildDetailsView(),
    );
  }
}

class _ChildDetailsView extends StatelessWidget {
  const _ChildDetailsView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lokal = Localizations.localeOf(context);

    final cubit = context.read<ChildDetailsCubit>();

    var _focusedDay = DateTime.now();

    return BlocBuilder<ChildDetailsCubit, ChildDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(state.child.fullName), centerTitle: true),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  color: state.child.isGenderMale
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.child.fullName),
                        Text(state.child.diagnosis),
                        Text(state.child.age.toString()),
                        Text('parent id: ${state.child.parentId}'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ChoiceChip(
                        avatar: state.emotionsInCalendar == EmotionsInCalendar.all
                            ? Icon(
                                Icons.event_note,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              )
                            : Icon(
                                Icons.event_note_outlined,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              ),
                        showCheckmark: false,
                        label: Text(l10n.childDetailsScreenAllEmotions),
                        selected: state.emotionsInCalendar == EmotionsInCalendar.all,
                        onSelected: (_) {
                          cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.all);
                        },
                      ),
                      ChoiceChip(
                        showCheckmark: false,
                        avatar: state.emotionsInCalendar == EmotionsInCalendar.sad
                            ? Icon(
                                Icons.cloudy_snowing,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              )
                            : Icon(
                                Icons.cloud_outlined,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              ),
                        label: Text(l10n.emotionForecastSad),
                        selected: state.emotionsInCalendar == EmotionsInCalendar.sad,
                        onSelected: (_) {
                          cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.sad);
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChoiceChip(
                        showCheckmark: false,
                        avatar: state.emotionsInCalendar == EmotionsInCalendar.angry
                            ? Icon(
                                Icons.thunderstorm,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              )
                            : Icon(
                                Icons.thunderstorm_outlined,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              ),
                        label: Text(l10n.emotionForecastAngry),
                        selected: state.emotionsInCalendar == EmotionsInCalendar.angry,
                        onSelected: (_) {
                          cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.angry);
                        },
                      ),
                      ChoiceChip(
                        showCheckmark: false,
                        avatar: state.emotionsInCalendar == EmotionsInCalendar.happy
                            ? Icon(
                                Icons.sunny,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              )
                            : Icon(
                                Icons.wb_sunny_outlined,
                                color: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white
                                    : null,
                              ),
                        label: Text(l10n.emotionForecastHappy),
                        selected: state.emotionsInCalendar == EmotionsInCalendar.happy,
                        onSelected: (_) {
                          cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.happy);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TableCalendar(
                onPageChanged: (focusedDay) => _focusedDay = focusedDay,
                headerStyle: const HeaderStyle(titleCentered: true, formatButtonVisible: false),
                focusedDay: _focusedDay,
                firstDay: DateTime(2022),
                startingDayOfWeek: StartingDayOfWeek.monday,
                lastDay: DateTime.now(),
                locale: '${lokal.languageCode}_${lokal.countryCode}',
                eventLoader: (day) {
                  if (state.emotionsInCalendar == EmotionsInCalendar.sad) {
                    var forecast = state.emotionForecast?.entries
                        .where(
                          (element) =>
                              element.key.year == day.year &&
                              element.key.month == day.month &&
                              element.key.day == day.day &&
                              element.value == EmotionForecast.sad,
                        )
                        .map((e) => e.value)
                        .toList();

                    return forecast ?? [];
                  } else if (state.emotionsInCalendar == EmotionsInCalendar.happy) {
                    var forecast = state.emotionForecast?.entries
                        .where(
                          (element) =>
                              element.key.year == day.year &&
                              element.key.month == day.month &&
                              element.key.day == day.day &&
                              element.value == EmotionForecast.happy,
                        )
                        .map((e) => e.value)
                        .toList();

                    return forecast ?? [];
                  } else if (state.emotionsInCalendar == EmotionsInCalendar.angry) {
                    var forecast = state.emotionForecast?.entries
                        .where(
                          (element) =>
                              element.key.year == day.year &&
                              element.key.month == day.month &&
                              element.key.day == day.day &&
                              element.value == EmotionForecast.angry,
                        )
                        .map((e) => e.value)
                        .toList();

                    return forecast ?? [];
                  } else {
                    var forecast = state.emotionForecast?.entries
                        .where(
                          (element) =>
                              element.key.year == day.year &&
                              element.key.month == day.month &&
                              element.key.day == day.day,
                        )
                        .map((e) => e.value)
                        .toList();

                    return forecast ?? [];
                  }

/*

                  var forecast = state.emotionForecast?.entries
                      .where(
                        (element) =>
                            element.key.year == day.year &&
                            element.key.month == day.month &&
                            element.key.day == day.day,
                      )
                      .map((e) => e.value)
                      .toList();

                  return forecast ?? [];
*/
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    if (events.isNotEmpty) {
                      final a = events as List<EmotionForecast>;
                      for (var element in a) {
                        if (element.name == EmotionForecast.sad.name) {
                          return Icon(Icons.cloudy_snowing);
                        } else if (element.name == EmotionForecast.happy.name) {
                          return Icon(Icons.wb_sunny_outlined);
                        } else {
                          return Icon(Icons.thunderstorm);
                        }
                      }
                    }
                    return null;
                  },
                ),
              ),

/*
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.pink,
                    title: Text(state.activityRecords?[index].timeOfActivity.toString() ?? 'null'),
                    onTap: () => context.goNamed(
                      EmotionStationRoutes.completedActivityDetails.routeName,
                      extra: ChildRouteData(
                        child: null,
                        activityRecord: state.activityRecords?[index],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: state.activityRecords?.length ?? 0,
              ),
*/
            ],
          ),
          floatingActionButton: cubit.authenticationManager.getCurrentUser().isParent
              ? FloatingActionButton.extended(
                  icon: Icon(Icons.mood),
                  label: Text(l10n.childDetailsScreenAddEmotion),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AddEmotionDialog(
                      selectedEmotion: state.selectedEmotionAddDialog,
                      childName: state.child.name,
                      setForecastEmotion: (EmotionForecast emotion) =>
                          cubit.selectForecastEmotionAddDialog(emotion),
                      setForecastDate: (DateTime date) => cubit.selectForecastDateAddDialog(date),
                      setForecast: () => cubit.updateChildEmotionForecast(),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
