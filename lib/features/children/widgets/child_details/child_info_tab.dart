import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/child_details_cubit.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ChildInfoTab extends StatelessWidget {
  const ChildInfoTab({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<ChildDetailsCubit>();
    final lokal = Localizations.localeOf(context);
    var focusedDay = DateTime.now();

    const childDescTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.italic,
    );

    const childDescTitleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    l10n.emotionForecast.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TableCalendar(
                    onPageChanged: (focusedDay) => focusedDay = focusedDay,
                    headerStyle: const HeaderStyle(titleCentered: true, formatButtonVisible: false),
                    focusedDay: focusedDay,
                    firstDay: child.treatmentStartMonth ?? DateTime(2022),
                    //firstDay: DateTime(2022),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    lastDay: DateTime.now(),
                    locale: '${lokal.languageCode}_${lokal.countryCode}',
                    eventLoader: (day) {
                      if (cubit.state.emotionsInCalendar == EmotionsInCalendar.sad) {
                        var forecast = cubit.state.emotionForecast?.entries
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
                      } else if (cubit.state.emotionsInCalendar == EmotionsInCalendar.happy) {
                        var forecast = cubit.state.emotionForecast?.entries
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
                      } else if (cubit.state.emotionsInCalendar == EmotionsInCalendar.angry) {
                        var forecast = cubit.state.emotionForecast?.entries
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
                        var forecast = cubit.state.emotionForecast?.entries
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
                    },
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, day, events) {
                        if (events.isNotEmpty) {
                          final a = events as List<EmotionForecast>;
                          for (var element in a) {
                            if (element.name == EmotionForecast.sad.name) {
                              return const Icon(Icons.cloudy_snowing);
                            } else if (element.name == EmotionForecast.happy.name) {
                              return const Icon(Icons.wb_sunny_outlined);
                            } else {
                              return const Icon(Icons.thunderstorm);
                            }
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChoiceChip(
                    avatar: cubit.state.emotionsInCalendar == EmotionsInCalendar.all
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
                    selected: cubit.state.emotionsInCalendar == EmotionsInCalendar.all,
                    onSelected: (_) {
                      cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.all);
                    },
                  ),
                  ChoiceChip(
                    showCheckmark: false,
                    avatar: cubit.state.emotionsInCalendar == EmotionsInCalendar.sad
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
                    selected: cubit.state.emotionsInCalendar == EmotionsInCalendar.sad,
                    onSelected: (_) {
                      cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.sad);
                    },
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChoiceChip(
                    showCheckmark: false,
                    avatar: cubit.state.emotionsInCalendar == EmotionsInCalendar.angry
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
                    selected: cubit.state.emotionsInCalendar == EmotionsInCalendar.angry,
                    onSelected: (_) {
                      cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.angry);
                    },
                  ),
                  ChoiceChip(
                    showCheckmark: false,
                    avatar: cubit.state.emotionsInCalendar == EmotionsInCalendar.happy
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
                    selected: cubit.state.emotionsInCalendar == EmotionsInCalendar.happy,
                    onSelected: (_) {
                      cubit.selectForecastEmotionToDisplay(EmotionsInCalendar.happy);
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: child.isGenderMale
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.tertiaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.childrenScreenEnterChildDiagnosis.toUpperCase(),
                      style: childDescTitleTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      child.diagnosis,
                      style: childDescTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      l10n.childrenScreenEnterChildAge.toUpperCase(),
                      style: childDescTitleTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      child.age.toString(),
                      style: childDescTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      l10n.childrenScreenEnterChildPregnancyStartOfTreatment.toUpperCase(),
                      style: childDescTitleTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      DateFormat('MM/yyyy').format(child.treatmentStartMonth ?? DateTime.now()),
                      style: childDescTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      l10n.childrenScreenEnterChildAttendsKindergarten.toUpperCase(),
                      style: childDescTitleTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      child.attendsKindergarten ?? false ? l10n.yesString : l10n.noString,
                      style: childDescTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      l10n.childrenScreenEnterChildRiskyPregnancy.toUpperCase(),
                      style: childDescTitleTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      child.riskyPregnancy ?? false ? l10n.yesString : l10n.noString,
                      style: childDescTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      l10n.childrenScreenEnterChildPregnancyBirthWeek.toUpperCase(),
                      style: childDescTitleTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      child.pregnancyBirthWeek != null
                          ? child.pregnancyBirthWeek.toString()
                          : l10n.unknownString,
                      style: childDescTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.childDetailsScreenTherapistNote.toUpperCase(),
                      style: childDescTitleTextStyle,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      child.specialistNote ?? l10n.unknownString,
                      style: childDescTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 75.0),
        ],
      ),
    );
  }
}
